class BookController < ApplicationController

  get "/books" do
    authenticate_user!
    @user = current_user
    @books = Book.all
    erb :"books/book_index"
  end

  get "/books/new" do
    authenticate_user!
    erb :"books/books_create"
  end

  post "/books" do
    authenticate_user!
    author = Author.find_or_create_by(name: params["author"])
    genre = Genre.find_or_create_by(name: params["genre"])
    @book = Book.find_or_initialize_by(name: params["name"], author: author)
    if @book.id
      if !@book.users.include?(current_user)
        @book.users << current_user
        @book.save
      end
      redirect to "/books/#{@book.slug}/show"
      # only update values if the current user is the owner_id
    else
      # finish adding book attributes and set an owner
      @book.owner = current_user
      @book.users << current_user
      @book.genre = genre
      @book.save
      redirect to "/books/#{@book.slug}/show"
    end
  end

  get "/books/:slug" do
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

  patch "/books/:slug" do
    @book = Book.find_by_slug(params[:slug])
    if @book && @book.owner == current_user
      author = Author.find_or_create_by(name: params[:author])
      genre = Genre.find_or_create_by(name: params[:genre])
      @book.update(author: author, genre: genre)
      redirect to "/books/#{@book.slug}/show"
    end
    redirect to "/books"
  end

  delete "/books/:slug" do
    @book = Book.find_by_slug(params[:slug])
    @book.author_id = nil
    @book.genre_id = nil
    @book.delete
    redirect to "/books/index"
  end
end
