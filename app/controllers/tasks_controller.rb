class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update task_line_chart destroy ]

  def index
    @tasks = Task.all
    @projects = Project.all
  end

  def task_calendar
    @tasks = Task.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end

  def task_week_calendar
    @tasks = Task.where(
      start_time: Time.now.beginning_of_month.beginning_of_week..Time.now.end_of_month.end_of_week
    )
  end

  def task_line_chart
    render turbo_stream: turbo_stream.replace("graph", partial: "tasks/task_line_chart")
  end

  def show; end
  def edit; end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :description,
      :completed,
      :start_time,
      :end_time,
      :deadline,
      :project_id
    )
  end
end
