class TasksController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @task = Task.order(created_at: :desc).where(is_display: true).limit(5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'タスクを登録しました。'
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクを更新しました。'
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def hide
    @task = Task.order(created_at: :desc).where(is_display: false).limit(5)
  end
  
  private

  def task_params
    params.require(:task).permit(:title, :memo, :status)
  end

  def set_post
    @task = Task.find(params[:id])
  end
end
