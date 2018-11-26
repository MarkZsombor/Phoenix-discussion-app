defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  # alias allows for Topic to stand in for Discuss.Topic
  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> IO.inspect(changeset)
    end
  end
end
