require 'pry'
# relative to this file
require_relative 'database_config'
require_relative 'models/dish'
require_relative 'models/comment'
require_relative 'models/user'
require_relative 'models/category'

# ActiveRecord::Base.logger = Logger.new(STDOUT)

binding.pry