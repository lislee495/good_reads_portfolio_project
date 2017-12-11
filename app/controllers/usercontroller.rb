class UserController  < ApplicationController
  use Rack::Flash

  get "/users/:slug" do
    authenticate_user!
    @user = User.find_by_slug(params[:slug])
    if @user
      erb :"/users/show"
    else
      flash[:message] = "User not found"
      redirect to "/users/#{current_user.slug}"
    end
  end

  post "/users/:slug" do
    authenticate_user!
    user = User.find_by_slug(params[:slug])
    redirect to "/users/#{user.slug}"
  end

  get "/users/:slug/add" do
    authenticate_user!
    # only current user can add to their library
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user) && user
      @user = user
      erb :"/users/new"
    else
      flash[:message] = "Action not permitted"
      redirect to "/users/#{current_user.slug}"
    end
  end

  post "/add_book" do
    authenticate_user!
    @book = Book.find_or_initialize_by(name: params["name"])
    if @book.id
      if !@book.users.include?(current_user)
        @book.users << current_user
        @book.save
        redirect to "/users/#{current_user.slug}"
      end
      # only update values if the current user is the owner_id
    else
      # finish adding book attributes and set an owner
      @book.owner = current_user
      @book.users << current_user
      @book.genre = Genre.find_or_create_by(params["genre"])
      @book.author = Author.find_or_create_by(params["author"])
      @book.save
      redirect to "/users/#{current_user.slug}"
    end
  end

  get "/users/:slug/edit" do
    authenticate_user!
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user) && user
      @user = user
      erb :"/users/edit"
    else
      flash[:message] = "Action not permitted."
      redirect to "/users/#{current_user.slug}"
    end
  end

  post "/:book_id/show" do
    authenticate_user!
    @book = Book.find_by_id(params[:book_id])
    redirect to "/books/#{@book.slug}"
  end

  post "/:book_id/edit" do
    authenticate_user!
    @book = Book.find_by_id(params[:book_id])
    redirect to "/books/#{@book.slug}/edit"
  end

  post "/users/:slug/:book_id/delete" do
    authenticate_user!
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user) && user
      association = BooksUser.find_by(book_id: params[:book_id], user_id: user.id)
      association.delete
      # deletes association but not the book
      redirect to "/users/#{user.slug}"
    else
      flash[:message] = "Action not permitted."
      redirect to "/users/#{current_user.slug}"
    end
  end

  private
  def authenticate_user!
    if !logged_in?
      flash[:message] = "Please sign up or login first."
      redirect to "/"
    end
  end

end
