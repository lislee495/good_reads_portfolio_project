class UserController  < ApplicationController

  get "/users/:slug" do
    # anyone can view but not edit a user profile
    @user = User.find_by_slug(params[:slug])
    erb :"/users/user_profile"
  end

  post "/users/:slug/add" do
    user = User.find_by_slug(params[:slug])
    redirect to "/users/#{user.slug}/add"
  end

  get "/users/:slug/add" do
    # only current user can add or edit their own page
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user)
      @user = user
      erb :"/users/user_create"
    else
      redirect to "/login"
    end
  end

  post "/my_books" do
    author = Author.find_or_create_by(name: params["author"])
    genre = Genre.find_or_create_by(name: params["genre"])
    book = Book.find_or_create_by(name: params["book name"])
    book.author = author
    book.genre = genre
    book.user_ids = current_user.id
    book.save
    redirect to "/users/#{current_user.slug}"
  end

  get "/users/:slug/edit" do
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user)
      @user = user
      erb :"/users/user_edit"
    else
      redirect to "/login"
    end
  end

  post "/:book_id/show" do
    @book = Book.find_by_id(params[:book_id])
    redirect to "/books/#{@book.slug}/show"
  end

  post "/:book_id/edit" do
    @book = Book.find_by_id(params[:book_id])
    redirect to "/books/#{@book.slug}/edit"
  end

  post "/users/:slug/:book_id/delete" do
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user)
      association = BooksUser.find_by(book_id: params[:book_id], user_id: @user.id)
      association.delete
      # deletes association but not the book
      redirect to "/users/#{@user.slug}"
    else
      redirect to "/login"
    end
  end
end
