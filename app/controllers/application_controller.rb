require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, "travel_tracker"
  end

  get "/" do
    erb :index
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      # memoization
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
     
    end

    def logout!
      session.clear
    end 
  end
end
