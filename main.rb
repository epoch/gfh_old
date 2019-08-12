require 'sinatra'

require 'sinatra/reloader'
also_reload File.expand_path(__dir__, 'models/*')
also_reload File.expand_path(__dir__, 'views/*')

require_relative 'database_config'

require_relative "models/dish"
require_relative "models/comment"
require_relative "models/user"
require_relative "models/category"

enable :sessions

# make methods also be available in templates
helpers do

  def logged_in? # predicate method - will return a boolean
    # !!current_user
    if current_user
      return true
    else
      return false
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @dishes = Dish.order(:created_at => 'desc').limit(3)
  erb :home
end

get '/my_dishes' do
  @dishes = Dish.where(user_id: current_user.id)
  erb :my_dishes
end

require_relative 'routes/dishes'
require_relative 'routes/comments'
require_relative 'routes/sessions'






