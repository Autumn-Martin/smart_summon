class ChampionsController < ApplicationController
  def index
    if params[:role_id]
      role = Role.find(params[:role_id])
      @champions = role.champions.all
    else
      @champions = Champion.all
    end
  end

  def show
    @champion = Champion.find(params[:id])
  end
end
