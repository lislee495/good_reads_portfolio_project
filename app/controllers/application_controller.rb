require './config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "password_security"
  end

  get "/" do
    erb :homepage
  end

  get "/signup" do
    erb :sign_up
  end

  post "/signup" do
    if params.values.any?{|v| v.nil? || v.length == 0}
      redirect to "/signup"
    else
      user = User.create(username: params[:username], password: params[:password], email: params[:email])
      session[:user_id] = user.id
      redirect to "/login"
    end
  end

  get "/login" do
    erb :log_in
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to "/"
    end
  end

  helpers do
    def logged_in?
			!!session[:user_id]
		end
		def current_user
			User.find(session[:user_id])
		end
  end

end
