class PostsController < ApplicationController

    get '/posts' do
        "A List Of Travel Destinations"
    end
    
    get '/posts/new' do
        if !logged_in?
            redirect "/login"
        else
            "Add A New Travel Destination"
        end
    end

    get '/posts/:id/edit' do
        if !logged_in?
            redirect "/login"
        else
            if post = current_user.posts.find(params[:id])
                "An edit post form #{current_user.id} is editing #{post.id}"
            else
                redirect '/posts'
            end
        end
    end

end