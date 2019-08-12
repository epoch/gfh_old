post '/comments' do
  redirect '/login' unless session[:user_id]
  # insert comment into db
  # params[:body]
  @comment = Comment.new
  @comment.body = params[:body]
  @comment.dish_id = params[:dish_id]
  @comment.user_id = current_user.id
  if @comment.save
    redirect "/dishes/#{params[:dish_id]}"
  else
    # i want this - comment.errors
    @dish = Dish.find(@comment.dish_id)
    @comments = Comment.where(dish_id: @comment.dish_id)
    erb :show
  end
end