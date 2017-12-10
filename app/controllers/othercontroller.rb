class OtherController < ApplicationController
  before do
    set_user
    authenticate_user!
  end

  get "/authors" do
    @authors = Author.all
    erb :"author/author_index"
  end

  get "/authors/:slug" do
    @author = Author.find_by_slug(params[:slug])
    if @author
      erb :"author/author_show"
    else
      flash[:message] = "Author not found"
      redirect to "/authors"
    end
  end

  get "/genres" do
    @genres = Genre.all
    erb :"genre/index"
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    if @genre
      erb :"genre/show"
    else
      flash[:message] = "Genre not found"
      redirect to "/genre"
    end
  end

end
