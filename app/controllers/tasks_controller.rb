class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:position)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task_position = Task.all.count + 1
    task = Task.create(body: params[:task][:body])
    task.position = task_position
    @task = task
    task.save!
    redirect_to task_path(@task.id)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if params[:completed]
      binding.pry
      @task.update(complted: params[complted])
      redirect_to :back
    end
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

  private
    def task_params
      params.require(:task).permit(:body)
    end
end
