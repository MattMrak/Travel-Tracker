class PostsController < ApplicationController

    get '/posts' do
        "A List Of Travel Destinations"
        @posts = Post.all
        erb :'posts/index'
    end
    
    get '/posts/new' do
        if !logged_in?
            redirect "/login"
        else
            "Add A New Travel Destination"
            erb :'posts/new'
        end
    end

    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :'posts/show'
    end

    get '/posts/:id/edit' do
        if !logged_in?
            redirect "/login"
        else
            if post = current_user.posts.find(params[:id])
                "An edit post form #{current_user.id} is editing #{post.id}"
                erb :'posts/edit'
            else
                redirect '/posts'
            end
        end
    end

    post '/posts' do
        @post = Post.create(params[:post])
        redirect "/posts/#{@post.id}"
    end
    
    patch '/posts/:id' do
        @post = Post.find(params[:id])
        @post.update(params[:post])
        redirect "/posts/#{@post.id}"
    end

    post '/posts/:id' do
        if !logged_in?
            redirect "/login"
        else
            "Delete A Travel Destination"
            @post = Post.find(params[:id])
            @post.delete(params[:post])
            redirect "/posts"
        end
    end

end