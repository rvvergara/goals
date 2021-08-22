class V1::GoalsController < ApplicationController
  def index
    goals = Goal.all
    render :index, locals: { goals: goals }
  end

  def show
    goal = Goal.find(params[:id])
    render :show, locals: { goal: goal }
  end
end
