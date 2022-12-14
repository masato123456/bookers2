class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
    redirect_to user_path(current_user)
   else
    render :new
   end
  end

  def index
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end
  
  def edit
  @book=Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to user_path(current_user)
  end


  private

  def book_params
    params.require(:book).permit(:title,:body)
end

end
