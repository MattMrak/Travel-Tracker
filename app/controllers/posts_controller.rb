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
            "Edit A Travel Destination"
        end
    end

end