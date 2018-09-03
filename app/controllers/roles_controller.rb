class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
    @champions = @role.champions.all
  end
end
