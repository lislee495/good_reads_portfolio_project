require './config/environment'
require 'sinatra/base'
require 'rack-flash'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end
  use Rack::Flash

  get "/" do
    erb :homepage, :layout => false
  end

  get "/signup" do
    erb :signup, :layout => false
  end

  post "/signup" do
    if params.values.any?{|v| v.nil? || v.length == 0}
      redirect to "/signup"
    else
      if User.find_by(username: params[:username])
        flash[:message] = "Username already taken."
        redirect to "/signup"
      elsif User.find_by(email: params[:email])
        flash[:message] = "Email already taken."
        redirect to "/signup"
      else
        user = User.create(username: params[:username], password: params[:password], email: params[:email])
        session[:user_id] = user.id
        redirect to "/login"
      end
    end
  end

  get "/login" do
    if logged_in?
      redirect to "/users/#{current_user.slug}"
    else
      erb :login, :layout => false
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to "/users/#{user.slug}"
    else
      flash[:message] = "Incorrect login."
      redirect to "/login"
    end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to "/"
    else
      redirect to "/"
    end
  end

private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end
end
