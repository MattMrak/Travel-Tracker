require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "travel_destinations"
  end

  get "/" do
    erb :welcome
  end


  helpers do

    def logged_in?
      !!session[:email]
    end

    def login(email)
      # Is the user who they claim to be?
      session[:email] = email
    end

    def logout!
      session.clear
    end

  end

end
