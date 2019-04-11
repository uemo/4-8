class ShelvesController < ApplicationController
  def top
  end

  def index
    @shelves = Shelf.all
    @shelf = Shelf.new
  end

  def show
    @shelf = Shelf.find(params[:id])
  end

  def create
    shelf = Shelf.new(shelf_params)
    if shelf.save
      flash[:notice] = "Book was successfully updated."
      redirect_to shelf_path(shelf)
    else
      render("shelves/new")
    end
  end

  def edit
    @shelf = Shelf.find(params[:id])
  end
  def update
    shelf = Shelf.find(params[:id])
    if shelf.update(shelf_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to shelf_path(shelf)
    else
      render("shelves/new")
    end
  end

  def destroy
    shelf = Shelf.find(params[:id])
    shelf.destroy
    redirect_to shelves_path
  end

  private
  def shelf_params
    params.require(:shelf).permit(:title, :category, :body)
  end

end
