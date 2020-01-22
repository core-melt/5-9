class BooksController < ApplicationController
	def index
		@user = User.find(current_user.id)
		@users = User.all
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def create
      book = Book.new(book_params)
	  book.user_id = current_user.id

      if book.save == true
      	flash[:success] = 'You have creatad book successfully.'
        redirect_to book_path(book.id)
      else
      	@user = User.find(current_user.id)
        @book = book
        @books = Book.all
        render action: :index
      end
	end

	def update
	    book = Book.find(params[:id])
	    if book.update(book_params) == true
	    	flash[:success] = 'You have updated book successfully.'
	    	redirect_to book_path(book.id)
	    else
	    	@book = book
	    	render action: :edit
	    end
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
	end

    private

    def book_params
        params.require(:book).permit(:title, :body, :user_id)
    end
end
