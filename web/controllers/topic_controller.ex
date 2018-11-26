defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  # alias allows for Topic to stand in for Discuss.Topic
  alias Discuss.Topic

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html"
  end

end
