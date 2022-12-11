class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
  end

  def create
    book = Book.index(book_params)
    book.save
    redirect_to '/index'
  end

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
