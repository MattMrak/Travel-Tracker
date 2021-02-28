class DestinationsController < ApplicationController
    
    #show a list of all destinations
  get "/destinations" do
    #get all the destinations
    @destinations = Destination.all
    #render the view
    erb :"destinations/index"
  end

  get "/destinations/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :"destinations/new"
    end
  end

  post "/destinations" do
    #model, create a new destination
    @destination = Destination.create(params)
    #response?
    redirect "/destinations/#{@destination.id}"
  end

  #to show a single destination
  get "/destinations/:id" do
    #model?
    @destination = Destination.find(params[:id])
    #response?
    erb :"destinations/show"
  end

  get "/destinations/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      #model? 
      @destination = Destination.find(params[:id])
      #response?
      erb :"/destinations/edit"
    end
  end

  put "/destinations/:id" do
    #find the instance of the destination
    destination = Destination.find(params[:id])
    #perform an update on the instance using params
    #make sure it saves
    destination.update(params[:destination])
    #response?
    redirect "/destinations/#{destination.id}"
  end

  delete "/destinations/:id" do
    if !logged_in?
      redirect "/login"
    else
      #model
      destination = Destination.find(params[:id])
      destination.destroy
      #response
      redirect "/destinations"
    end
  end

end