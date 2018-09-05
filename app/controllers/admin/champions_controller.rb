class Admin::ChampionsController < ApplicationController
  before_action :require_admin
  def index
    @champions = Champion.all
  end

  private
    def require_admin
      render file: "public/404" unless current_admin?
    end
end
