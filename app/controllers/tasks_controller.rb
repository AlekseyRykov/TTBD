class TasksController < ApplicationController
  before_action :set_project, only: [:edit, :create, :update, :complete, :destroy]
  before_action :set_task, only: [:edit, :update, :complete, :destroy]

  # def index
  #   @tasks = Task.all
  # end

  # def show
  # end

  # def new
  #   @task = Task.new
  # end

  def edit
  end

  def create
    # @task = Task.new(task_params)
    @task = @project.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        # format.json { render :show, status: :created, location: @task }
      else
        format.html { render "projects/show" }
        # format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @project, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def complete
    respond_to do |format|
      @task.update(complete_params)
      format.html { redirect_to @project, notice: 'Task was successfully completed.' }
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Task was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    # @task = Task.find(params[:id])
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:project_id, :description, :date, :time, :priority)
  end

  def complete_params
    params.require(:complete_status).permit(:completed)
  end
end
