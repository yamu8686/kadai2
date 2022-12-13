class BooksController < ApplicationController

  def top
     @book = Book.find(params[:id])
  end

  def new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @user = current_user
    @new_book = Book.new(book_params)
    @book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(@new_book)
      redirect_to book_path(@book.id)
    else
      flash[:alert] = "投稿に失敗しました。"
      @books = Book.all
      render :index
    end
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def back
    book =Book.find(params[:id])
    book.back
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
