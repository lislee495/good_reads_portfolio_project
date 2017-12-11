class OtherController < ApplicationController
  use Rack::Flash
  get "/authors" do
    set_user
    @authors = Author.all
    erb :"author/index"
  end

  get "/authors/:slug" do
    set_user
    @author = Author.find_by_slug(params[:slug])
    if @author
      erb :"author/show"
    else
      flash[:message] = "Author not found"
      redirect to "/authors"
    end
  end

  get "/genres" do
    set_user
    @genres = Genre.all
    erb :"genres/index"
  end

  get "/genres/:slug" do
    set_user
    @genre = Genre.find_by_slug(params[:slug])
    if @genre
      erb :"genres/show"
    else
      flash[:message] = "Genre not found"
      redirect to "/genre"
    end
  end

  private
  def set_user
    if logged_in?
      @user = current_user
    else
      flash[:message] = "Please sign up or login first."
      redirect to "/"
    end
  end

end
