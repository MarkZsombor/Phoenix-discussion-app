defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  # alias allows for Topic to stand in for Discuss.Topic
  alias Discuss.Topic

  def index(conn, _params) do 
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
        # render conn, "index.html"
      {:error, changeset} -> 
        render conn, "new.html", changeset: changeset
    end
  end
end
