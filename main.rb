     
require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'
require_relative 'models/dish'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @dishes = Dish.all
  erb :index
end

get '/dishes/new' do
  erb :new
end

post '/dishes' do
  dish = Dish.new
  dish.title = params[:title]
  dish.image_url = params[:image_url]
  dish.save
  redirect '/'
end

get '/dishes/:id' do
  @dish = Dish.find(params[:id])
  erb :show
end

get '/dishes/:id/edit' do
  erb :
end





