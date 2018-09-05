class Admin::ChampionsController < Admin::BaseController
  def index
    @champions = Champion.all
  end

  def new
    @champion = Champion.new
  end

  def create
    @champion = Champion.create(champion_params)

    redirect_to champion_path(@champion)
  end

  private

    def champion_params
      params.require(:champion).permit(:name, :damage, :primary_class, :secondary_class)
    end

end
