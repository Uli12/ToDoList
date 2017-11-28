class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
    # GET single page
  end

  def edit
    @todo = Todo.find(params[:id])
    # Shows a prefilled form to edit the page
  end

  def update
    @todo = Todo.find(params[:id])
  
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def new
    @todo = Todo.new 
  end

  def create
    @todo = Todo.new(todo_params)
 
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to todos_path
  end
 
  private
  
     def todo_params
       params.require(:todo).permit(:title, :date, :body, :completed)
     end
end
