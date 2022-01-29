class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :update]
  def new
    @book=Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = 'Book was successfully created'
      redirect_to book_path(@book.id)
    else
      flash[:alert] = 'Book was not created'
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = User.new
    @user = current_user

    @book = Book.new

    @books = Book.all


  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    #@book_all = Book.where(title: @books.title)


  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
       flash[:notice] = 'Book was destroy'
    redirect_to books_path

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'Book was update successfully'
       redirect_to book_path
    else
       flash[:notice] = 'Book was not update'
       render :edit
    end
  end

  def edit
     @book = Book.find(params[:id])
      if @book.save
         flash[:notice] = 'Book was edit successfully '
      end

  end



  private
   def book_params
    params.require(:book).permit(:title, :body,)
   end

    def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end
end