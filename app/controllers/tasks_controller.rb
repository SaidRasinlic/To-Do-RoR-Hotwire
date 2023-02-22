class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      format.html do
        if @task.save
          flash[:success] = 'Post saved successfully.'
          redirect_to tasks_url
        else
          flash[:error] = @task.errors.full_messages.to_sentence
          render :new
        end
      end
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: 'Success' }
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
