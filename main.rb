require 'sinatra'
require 'sinatra/reloader'
require_relative 'database_config'

require_relative "models/dish"
require_relative "models/comment"
require_relative "models/user"

enable :sessions

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
  # redirect '/login' unless session[:user_id]
  @dish = Dish.find(params[:id])
  @comments = Comment.where(dish_id: params[:id])
  erb :show
end

# read - fetch me the edit form
get '/dishes/:id/edit' do
  @dish = Dish.find(params[:id])
  erb :edit
end

# update existing dish
put '/dishes/:id' do
  # params[:id]
  # params[:title]
  # params[:image_url]
  dish = Dish.find(params[:id])
  dish.title = params[:title]
  dish.image_url = params[:image_url]
  dish.save
  redirect "/dishes/#{dish.id}"
end

delete "/dishes/:id" do
  # 1. remove record from database
  dish = Dish.find(params[:id]) # no @ symbol because no template for this route
  dish.destroy # dish.delete also works
  # 2. redirect
  redirect "/"
end

post '/comments' do
  redirect '/login' unless session[:user_id]
  # insert comment into db
  # params[:body]
  comment = Comment.new
  comment.body = params[:body]
  comment.dish_id = params[:dish_id]
  comment.save
  redirect "/dishes/#{params[:dish_id]}"
end

get '/login' do
  erb :login
end

post '/session' do
  # params[:email]
  # params[:password]
  # 1. look up the user with email address
  user = User.find_by(email: params[:email])
  # 2.
  if user && user.authenticate(params[:password])
    # create a session
    session[:user_id] = user.id # its a hash - named session
    # yay - please follow me
    redirect "/"
  else
    # wrong email or password
    erb :login
  end
end

delete '/session' do
  # 1. destroy the session
  session[:user_id] = nil
  # 2. redirect
  redirect '/login'
end





