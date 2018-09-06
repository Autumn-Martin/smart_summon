class SkillsController < ApplicationController
  def create
    @skill = Skill.new(skill_params)
    @skill.champion_id = params[:champion_id]

    @skill.save

    redirect_to champion_path(@skill.champion)
  end
end

private
  def skill_params
    params.require(:skill).permit(:passive,:q,:w,:e,:r)
  end
