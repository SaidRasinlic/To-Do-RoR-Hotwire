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
          flash[:success] = "Post saved successfully."
          redirect_to tasks_url
        else
          flash[:error] = @task.errors.full_messages.to_sentence
          render :new
        end
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html do
        if @task.update(task_params)
          flash[:success] = "Task was successfully updated"
          redirect_to tasks_url
        else
          flash[:error] = @task.errors.full_messages.to_sentence
          render :edit
        end
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "Task was successfully deleted"
    redirect_to tasks_url
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: params[:completed])

    render json: { message: "Success" }
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
