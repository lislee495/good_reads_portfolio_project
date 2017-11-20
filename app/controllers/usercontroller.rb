class UserController  < ApplicationController

  get "/users/:slug" do
    # can view but not edit a user profile
    @user = User.find_by_slug(params[:slug])
    erb :"/users/user_profile.erb"
  end

  get "users/:slug/add" do
    # only current user can edit their own page
    user = User.find_by_slug(params[:slug])
    if logged_in? && (user == current_user)
      @user = user
      erb :"/users/user_create"
    else
      redirect to "/login"
    end
  end

  post "/my_books" do
    if !params[:users][:books].include?("")
      book = Book.find_or_create_by(params[:users][:books])
      # not sure if this functionality works ^
      book.save
      current_user.books << book
      redirect to "/users/#{current_user.slug}"
    else
      # flash message "Need to fill all fields"
      flash[:message] = "Need to fill all fields."
    end
  end

end
