class SessionsController < ApplicationController
    
      get '/login' do
        redirect "/users/#{current_user.id}" if logged_in?
        erb :"users/login"
      end
    
      post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect "/users/#{user.id}"
        else
          @error = "Invalid email or password. Please try again."
          erb :"/users/login"
        end
      end
    
      get '/logout' do
        redirect '/' if !logged_in?
        session.clear
        redirect '/'
      end
    end
    