# read - fetch me the new dish form
get '/dishes/new' do
  @dish = Dish.new
  erb :new
end

get '/dishes' do
  @dishes = Dish.all
  erb :index
end

post '/dishes' do
  @dish = Dish.new
  @dish.title = params[:title]
  @dish.image_url = params[:image_url]
  @dish.user_id = current_user.id
  if @dish.save
    redirect '/'
  else
    # @dish.errors.full_messages
    # not redirecting when the save fails - to stay in the same request
    erb :new
  end
end

get '/dishes/:id' do
  # redirect '/login' unless session[:user_id]
  @dish = Dish.find(params[:id])
  @comments = @dish.comments
  # @comments = Comment.where(dish_id: params[:id])
  @comment = Comment.new
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
