defmodule PhoenixApi.ErrorViewTest do
  use PhoenixApi.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(PhoenixApi.ErrorView, "404.json", []) ==
           %{"errors" => [%{code: 404, title: "File not found"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "render 500.json" do
    assert render(PhoenixApi.ErrorView, "500.json", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}], "jsonapi" => %{"version" => "1.0"}}
  end

  test "render any other" do
    assert render(PhoenixApi.ErrorView, "505.json", []) ==
           %{"errors" => [%{code: 500, title: "Internal Server Error"}], "jsonapi" => %{"version" => "1.0"}}
  end
end
