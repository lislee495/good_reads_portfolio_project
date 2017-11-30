class OtherController < ApplicationController
  get "/authors" do
    @user = current_user
    @authors = Author.all
    erb :"author/author_index"
  end

  get "/authors/:slug" do
    @user = current_user
    @author = Author.find_by_slug(params[:slug])
    erb :"author/author_show"
  end

  get "/genres" do
    @user = current_user
    @genres = Genre.all
    erb :"genre/genre_index"
  end

  get "/genres/:slug" do
    @user = current_user
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genre/genre_show"
  end

end
