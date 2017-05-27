defmodule PhoenixApi.UserView do
    use PhoenixApi.Web, :view

    def render("index.json", %{users: users}) do
        %{data: render_many(users, PhoenixApi.UserView, "user.json")}
    end

    def render("show.json", %{user: user}) do
        %{data: render_one(user, PhoenixApi.UserView, "user.json")}
    end
    

    def render("user.json", %{user: user}) do
        %{
            "type": "user",
            "id": user.id,
            "attributes": %{
                "email": user.email
            }
        }
    end
end