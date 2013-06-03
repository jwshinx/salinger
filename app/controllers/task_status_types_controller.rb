class TaskStatusTypesController < ApplicationController
  layout 'task_status_type'
  load_and_authorize_resource

  def index
    #@task_status_types = TaskStatusType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @task_status_types }
    end
  end

  def show
    #@task_status_type = TaskStatusType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task_status_type }
    end
  end

  def new
    #@task_status_type = TaskStatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task_status_type }
    end
  end

  def edit
    #@task_status_type = TaskStatusType.find(params[:id])
  end

  def create
    #@task_status_type = TaskStatusType.new(params[:task_status_type])
    @task_status_type.creator = current_user
    @task_status_type.updater = current_user

    respond_to do |format|
      if @task_status_type.save
        format.html { redirect_to @task_status_type, notice: 'Task status type was successfully created.' }
        format.json { render json: @task_status_type, status: :created, location: @task_status_type }
      else
        format.html { render action: "new" }
        format.json { render json: @task_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@task_status_type = TaskStatusType.find(params[:id])
    @task_status_type.updater = current_user

    respond_to do |format|
      if @task_status_type.update_attributes(params[:task_status_type])
        format.html { redirect_to @task_status_type, notice: 'Task status type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task_status_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@task_status_type = TaskStatusType.find(params[:id])
    @task_status_type.destroy

    respond_to do |format|
      format.html { redirect_to task_status_types_url }
      format.json { head :no_content }
    end
  end
end
