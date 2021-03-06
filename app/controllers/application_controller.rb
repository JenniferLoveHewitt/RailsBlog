class ApplicationController < ActionController::Base

  def render_404
    render file: "public/404.html", status: 404
  end

  protect_from_forgery with: :exception
end
