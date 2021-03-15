class DestinationsController < ApplicationController
 
  get '/destinations' do
    redirect '/login' unless logged_in?
    @user = current_user
    @destinations = Destination.all
    erb :'destinations/index'
  end

  get '/destinations/new' do
    redirect '/login' if !logged_in?
    erb :'destinations/new'
  end

  post '/destinations' do
    destination = current_user.destinations.new(params[:destination])
    if destination.location.empty? || destination.date_visited.empty?
      erb :"/destinations/new"
    else
      if destination.save
        redirect "/destinations/#{destination.id}"
      else
        redirect '/destinations/new'
      end
    end
  end

  get '/destinations/:id' do
    redirect '/login' if !logged_in?
    @destination = Destination.find(params[:id])
    erb :"destinations/show"
  end
  post "/destinations/:id/posts" do
    redirect '/login' if !logged_in?
    comment = current_user.comments.build(body: params[:comment][:body], destination_id: params[:id])
    if comment.save
      redirect "/destinations/#{params[:id]}"
    else
      # flash[:error] = destination.errors.full_messages.to_sentence
      redirect "/destinations/#{params[:id]}"
    end
  end

  get "/destinations/:id/edit" do
    redirect '/login' if !logged_in?
    @destination = Destination.find(params[:id])
    redirect '/destinations' if current_user != @destination.user
    erb :"destinations/edit"
  end

  patch "/destinations/:id" do
    @destination = Destination.find(params[:id])
    if params[:destination].include?("location" || "date_visited")
      # if @destination && @destination.update(params[:destination])
      redirect "/destinations/#{@destination.id}"
      # else 
      #     @error = true
      #     erb :"/destinations/edit"
      # end
    else
      @error = true
      erb :"/destinations/edit"
    end
  end

  delete "/destinations/:id/delete" do
    destination = Destination.find_by_id(params[:id])
    if current_user == destination.user
      if destination && destination.delete
        redirect "/users/#{destination.user_id}"
      else
        redirect "/destinations/#{params[:id]}"
      end
    else
      redirect '/destinations'
    end
  end

end