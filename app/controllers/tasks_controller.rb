require 'trackable'
class TasksController < ApplicationController
  include Trackable
  layout 'task'   
  #load_and_authorize_resource :except => [:my_tasks]
  load_and_authorize_resource 
  
  def my_tasks
    @tasks = Task.where(:assigned_to => current_user.id).order('due_date asc').all
    #authorize! :read, @tasks
  end
  def index
    #@tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def show
    #@task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def new
    #@task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  def edit
    #@task = Task.find(params[:id])
  end

  def create
    #@task = Task.new(params[:task])
    set_creator_and_updater @task, current_user    
    #@task.status = TaskStatusType.pending.first
    @task.due_date = Date.strptime(params[:task][:due_date], '%m/%d/%Y') unless params[:task][:due_date].blank?
    @task.completed_on = Date.strptime(params[:task][:completed_on], '%m/%d/%Y') unless params[:task][:completed_on].blank?
  
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@task = Task.find(params[:id])
    @task.updater = current_user
    @task.due_date = Date.parse(params[:task][:due_date]) unless params[:task][:due_date].blank?
    @task.completed_on = Date.parse(params[:task][:completed_on]) unless params[:task][:completed_on].blank?

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
