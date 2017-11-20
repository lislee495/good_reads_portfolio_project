class UserController  < ApplicationController
  
  get "/users/:slug" do
    # can view but not edit a user profile
    @user = User.find_by_slug(params[:slug])
    erb :"/users/user_profile.erb"
  end

end
