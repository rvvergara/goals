class V1::GoalsController < ApplicationController
  def index
    goals = Goal.all
    render :index, locals: { goals: goals }
  end

  def show
    goal = Goal.find(params[:id])
    render :show, locals: { goal: goal }
  end

  def update
    goal = Goal.find(params[:id])
    if goal.update(goal_params)
      render json: { status: 'OK' }, status: :ok
    else
      render json: { error: 'Cannot update goal' }, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.permit(:title, :progress)
  end
end
