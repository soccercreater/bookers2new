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
    flash[:notice] = 'Book was update successfully'
    redirect_to user_path
   end


   def index
     @user = User.new
     @user = current_user
     @users = User.all
     @book = Book.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       flash[:notice] = 'Book was successfully created'
      redirect_to user_path(@user.id)
     else
      render :new
     end
        @book.user_id = current_user.id
     if @book.save
         flash[:notice] = 'Book was successfully created'
        redirect_to user_path(user.id)
     else
         @book = Book.new
         render :index
     end
   end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
