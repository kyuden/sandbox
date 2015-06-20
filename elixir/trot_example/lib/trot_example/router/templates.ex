defmodule TrotExample.Router.Templates do
  use Trot.Router
  use Trot.Template

  get "/hi" do
    render_template("hi.html.haml", [name: "kyuden"])
  end
end
