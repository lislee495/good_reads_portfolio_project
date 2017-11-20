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

  get "log_in" do
    erb :log_in
  end

end
