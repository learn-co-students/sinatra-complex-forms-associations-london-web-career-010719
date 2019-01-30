class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if !params["owner"]["name"].empty?
      @owner = Owner.create(params["owner"])
      @pet = Pet.create(name: params["pet"]["name"], owner_id: @owner.id)
    else
      @pet = Pet.create(params["pet"])
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    redirect to "pets/#{@pet.id}"
  end

end
