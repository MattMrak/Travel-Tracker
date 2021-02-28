class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        login(params[:email], params[:password])
        redirect '/destinations'
    end

    get '/logout' do
        logout!
        redirect "/"
    end

end