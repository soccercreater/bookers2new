class UsersController < ApplicationController
   def show
     @book = Book.new
     @user = User.find(params[:id])
     @books = @user.books
   end

   def edit
     @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
   end


   def index
     @users = User.all
   end

  def create
     @user = User.new(user_params)
   　if @user.save
      redirect_to user_path(@user.id)
    　else
      render :new
    　end
  　end



    @book.user_id = current_user.id
   if @book.save
     flash[:success] = 'Book was successfully created'
    redirect_to user_path(user.id)
   else
     @book = Book.new
     render :index
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end