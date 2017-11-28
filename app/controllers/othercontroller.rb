class OtherController < ApplicationController
  get "/authors" do
    @authors = Author.all
    erb :"author/author_index"
  end

  get "/authors/:slug" do
    @author = Author.find_by_slug(params[:slug])
    erb :"author/author_show"
  end

  get "/genres" do
    @genres = Genre.all
    erb :"genre/genre_index"
  end

  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genre/genre_show"
  end
end
