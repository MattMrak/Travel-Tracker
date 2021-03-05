class UsersController < ApplicationController

    get '/signup' do
      redirect "/users/#{current_user.id}" if logged_in?
      erb :"users/new"
    end
  
    post '/signup' do
      user = User.new(params) 
      if !user.email || !user.password
        @error = "Please enter a email and password!"
        erb :'/users/new'
      elsif User.find_by(email: user.email)
        @error = "This email is already in use, please use a different email."
        erb :'/users/new'
      else
        user.save
        session[:user_id] = user.id
        redirect '/destinations'
      end
    end
  
    get '/users/:id' do
      redirect '/' if !logged_in?
      @user = User.find_by(id: params[:id])
      @destinations = @user.destinations.all
      erb :"/users/show"
    end
  end