defmodule OhlcApiWeb.Router do
  use OhlcApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug OpenApiSpex.Plug.PutApiSpec, module: OhlcApiWeb.ApiSpec
  end

  scope "/" do
  #   pipe_through :browser # Use the default browser stack

    get "/swaggerui", OpenApiSpex.Plug.SwaggerUI, path: "/api/openapi"
  end

  scope "/api" do
    pipe_through :api
    get "/openapi", OpenApiSpex.Plug.RenderSpec, []

    scope "/", OhlcApiWeb do
      post "/insert", StockStatusController, :create
      get "/average", StockStatusController, :index
    end

  end
end
