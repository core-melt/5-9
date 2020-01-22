class UsersController < ApplicationController
	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new
	end
	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end
	def update
		user = User.find(current_user.id)
		if user.update(user_params) == true
			flash[:success] = 'You have updated user successfully.'
			redirect_to user_path(current_user.id)
		else
			@user = user
			render action: :edit
		end
	end
	def edit
		@user = User.find(current_user.id)
		if User.find(params[:id]).id != current_user.id
			redirect_to user_path(current_user.id)
		end
	end

    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
