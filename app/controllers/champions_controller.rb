class ChampionsController < ApplicationController
  def index
    role = Role.find(params[:role_id])
    @champions = role.champions.all
  end

  def show
    @champion = Champion.find(params[:id])
  end
end
