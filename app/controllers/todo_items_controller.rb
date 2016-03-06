class TodoItemsController < ApplicationController

  before_action :find_todo_list
  def index
  end

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params )

    if @todo_item.save
      flash[:success] = "Added todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "There was a problem adding that todo list item."
      render action: :new
    end
  end

  def edit
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "The todo item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])

    if @todo_item.destroy
      flash[:success] = "Todo item was successfully destroyed."
    else
      flash[:error] = "The todo item could not be destroyed"
    end

    redirect_to todo_list_todo_items_path
    # respond_to do |format|
    #   format.html { redirect_to todo_lists_url, notice: 'Todo item was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def url_options
    { todo_list_id: params[:todo_list_id] }.merge(super)
  end

  private

  def find_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
