class TasksController < ApplicationController
  def index
    @tasks = Task.page(params[:page])
  end

  def show
  end
end
