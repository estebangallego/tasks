class TasksController < ApplicationController
  def index
  	@task = Task.new
  	@tasks = Task.all.order('created_at DESC')
  end
  def create
  	# render :text => params.inspect
  	task = Task.new(task_params)
  	if task.save
  		flash[:succses] = 'Your task has been save it'
  		redirect_to request.referer
  	else
  		flash[:danger] = "Task can't be in blank"
  		redirect_to request.referer
  	end
  end

  def edit
  	@task = Task.find params[:id]
  end

  def update
  	task = Task.find params[:id]
  	if task.update(task_params)
  		flash[:succses] = 'Your task has been successfully updated'
  		redirect_to root_path
  	else
  		flash[:danger] = "Task can't be in blank"
  		redirect_to request.referer
  	end
  end

  def destroy
  	Task.destroy params[:id]
  	redirect_to request.referer
  end

  private
  def task_params    
    params.require(:task).permit(:task)
  end
end
