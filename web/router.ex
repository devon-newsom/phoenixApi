defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
    plug :accepts, ["json","json-api"]
  end

  pipeline :api_auth do
    plug :accepts, ["json", "json-api"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource
  end

  scope "/api", PhoenixApi do
    pipe_through :api
    post "/users", RegistrationController, :create
    
    post "/token", SessionController, :create, as: :login
  end

  scope "/api", PhoenixApi do
    pipe_through :api_auth
    get "/user/current", UserController, :current
  end
end
