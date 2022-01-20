class BooksController < ApplicationController
  def new
    @book=Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
     flash[:success] = 'Book was successfully created'
    redirect_to books_path
   else
    @books=Book
    render :new
   end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
       flash[:success] = 'Book was destroy'
    redirect_to new_book_path
    end
  end



  private
   def book_params
    params.require(:book).permit(:title, :opinion, :profile_image)
   end
end