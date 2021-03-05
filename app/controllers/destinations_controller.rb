class DestinationsController < ApplicationController
  # READ -  Index Action (all destinations by all users)
  # make get request to '/destinations'
  get '/destinations' do
    redirect '/login' unless logged_in?
    @user = current_user
    @destinations = Destination.all
    erb :'destinations/index'
  end

  # CREATE
  # Shows 'new destination' form and makes a new destination
  get '/destinations/new' do
    redirect '/login' if !logged_in?
    # destination_attr
    erb :'destinations/new'
  end

  post '/destinations' do
    destination = current_user.destinations.new(params[:destination])
    if destination.location.empty? || destination.date_visited.empty?
      @error = "Data invalid. Please fill out both fields."
      # destination_attr
      erb :"/destinations/new"
    else
      # persist problem object to db
      if destination.save
        #take user to problem show page
        redirect "/destinations/#{destination.id}"
      else
        #re-render the form
        redirect '/destinations/new'
      end
    end
  end

  # READ - Show Action (one destination)
  # get request to '/destinations/:id'
  get '/destinations/:id' do
    redirect '/login' if !logged_in?
    @destination = Destination.find(params[:id])
    erb :"destinations/show"
  end

  # UPDATE - Edit
  # make a get request to '/destinations/:id/edit'
  # renders view edit_destination.erb
  get "/destinations/:id/edit" do
    redirect '/login' if !logged_in?
    @destination = Destination.find(params[:id])
    # User authorization - only the user who created the destination can edit it
    redirect '/destinations' if current_user != @destination.user
    # destination_attr
    erb :"destinations/edit"
  end

  # make a patch request to '/destinations/:id/''
  # find instance of the model to update,
  # using id from params, update and save instance
  patch "/destinations/:id" do
    @destination = Destination.find(params[:id])
    # styles must be selected
    if params[:destination].include?("location" || "date_visited")
      @destination.update(params[:destination])
      redirect "/destinations/#{@destination.id}"
    else
      @error = true
      # destination_attr
      erb :"/destinations/edit"
    end
  end

  # DESTROY
  # make a delete request to '/destinations/:id'
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