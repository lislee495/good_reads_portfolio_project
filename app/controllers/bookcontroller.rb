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
      book = Book.find_or_create_by(name: params["name"])
      book.author = author
      book.user_id = current_user.id
      book.save
      redirect to "/books/#{book.id}/show"
    end
  end

  get "/books/:id/show" do
    # can view but not edit a user profile

    @book = Book.find_by(id: params["id"])
    erb :"/books/books_index"
  end

  get "/books/:slug/edit" do
    @book = Book.find_by_slug(params[:slug])
    erb :"/books/books_edit"
  end

  post "/books/:slug/edit" do
    @book = Book.find_by_slug(params[:slug])
  end

  patch "/books/:slug/edit" do
    @book = Book.find_by_slug(params[:slug])
    if params[:books] != ""
      @book.update(author: params[:books][][:author], genre: params[:books][][:genre])
      @book.save
      redirect to "/books/#{@book.slug}"
    else
      redirect to "/books/#{@book.slug}/edit"
    end

    delete "/books/:slug/delete" do
      @book = Book.find_by_slug(params[:slug])
      @book.Delete
      redirect to "/books/index"
    end
  end
