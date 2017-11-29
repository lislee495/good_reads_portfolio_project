class BookController < ApplicationController

  get "/books/index" do
    @books = Book.all
    erb :"books/book_index"
  end

  get "/books/new" do
    # only current user can edit their own page
    erb :"books/books_create"
  end

  post "/new_book" do
      author = Author.find_or_create_by(name: params["author"])
      genre = Genre.find_or_create_by(name: params["genre"])
      @book = Book.find_or_create_by(name: params["name"])
      @book.author = author
      @book.genre = genre
      @book.save
      redirect to "/books/#{@book.slug}/show"
  end

  get "/books/:slug/show" do
    # can view but not edit a user profile
    @book = Book.find_by_slug(params["slug"])
    erb :"/books/books_show"
  end
end

  #
  # get "/books/:slug/edit" do
  #   @book = Book.find_by_slug(params[:slug])
  #   erb :"/books/books_edit"
  # end
  #
  # post "/books/:slug/edit" do
  #   @book = Book.find_by_slug(params[:slug])
  # end
  #
  # patch "/books/:slug/edit" do
  #   @book = Book.find_by_slug(params[:slug])
  #   if params[:books] != ""
  #     @book.update(author: params[:books][][:author], genre: params[:books][][:genre])
  #     @book.save
  #     redirect to "/books/#{@book.slug}"
  #   else
  #     redirect to "/books/#{@book.slug}/edit"
  #   end
  #
  #   delete "/books/:slug/delete" do
  #     @book = Book.find_by_slug(params[:slug])
  #     @book.Delete
  #     redirect to "/books/index"
    # end
