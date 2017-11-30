class BookController < ApplicationController

  get "/books/index" do
    @user = current_user
    @books = Book.all
    erb :"books/book_index"
  end

  get "/books/new" do
    @user = current_user
    # only current user can edit their own page
    erb :"books/books_create"
  end

  post "/new_book" do
    author = Author.find_or_create_by(name: params["author"])
    genre = Genre.find_or_create_by(name: params["genre"])
    @book = Book.find_or_create_by(name: params["name"], author: author)
    @book.author = author
    @book.genre = genre
    @book.save
    redirect to "/books/#{@book.slug}/show"
  end

  get "/books/:slug/show" do
    # can view but not edit a user profile
    @user = current_user
    @book = Book.find_by_slug(params["slug"])
    erb :"/books/books_show"
  end

  get "/books/:slug/add" do
    @user = current_user
    @book = Book.find_by_slug(params[:slug])
    @user.books << @book
    redirect to "/users/#{@user.slug}"
  end

  get "/books/:slug/edit" do
    @user = current_user
    @book = Book.find_by_slug(params[:slug])
    erb :"/books/books_edit"
  end

  patch "/books/:slug/edit" do
    @book = Book.find_by_slug(params[:slug])
    author = Author.find_or_create_by(name: params[:author])
    genre = Genre.find_or_create_by(name: params[:genre])
    @book.update(author: author, genre: genre)
    @book.save
    redirect to "/books/#{@book.slug}/show"
  end

  delete "/books/:slug/delete" do
    @book = Book.find_by_slug(params[:slug])
    @book.author_id = nil
    @book.genre_id = nil
    @book.delete
    redirect to "/books/index"
  end
end
