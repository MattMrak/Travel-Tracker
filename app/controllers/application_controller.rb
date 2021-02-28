require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #line below tells our application to look for the _method key in params
    set :method_override, true
    enable :sessions
    set :session_secret, "travel_destinations"
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def login(email, password)
      # Check if user actually exists
      # If so, set the session using *** IF STATEMENT ASSIGNMENTS ***
      # 28-33. if it returns "truthy" you should end up with a local variable called "user"
      # 28-33. if no user is found, it will return Nil and redirect to "/login"
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect "/login"
      end
    end

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
      end
    end

    def logout!
      session.clear
    end

end