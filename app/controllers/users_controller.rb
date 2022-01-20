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
    if @user.update(user_params)
       flash[:success] = 'Book was update'
       redirect_to user_path
    end
   end

   def index
     @users = User.all
   end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end