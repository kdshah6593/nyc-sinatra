class LandmarksController < ApplicationController
  
   #index gets index page DONE
   get '/landmarks' do
      erb :'landmarks/index'
   end
 
   #new gets new form DONE
   get '/landmarks/new' do
      erb :'/landmarks/new'
   end
 
   #create posts new landmark, redirects to show
   post '/landmarks' do
      @landmark = Landmark.create(params[:landmark])
      if !params[:figure][:name].empty?
         @landmark.figure = Figure.create(params[:figure])
      end
      redirect to "/landmarks/#{@landmark.id}"
   end
 
   #show gets show page DONE
   get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/show'
   end
 
   #edit gets edit form DONE
   get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      erb :'landmarks/edit'
   end
 
   #update patches landmark, redirects to show
   patch '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      @landmark.update(params[:landmark])

      redirect to "/landmarks/#{@landmark.id}"
   end

end
