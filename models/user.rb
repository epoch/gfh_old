class User < ActiveRecord::Base
  has_secure_password
  # abstracts bcrypt for us
  # this will add some new methods for user for you
  # .password = 'pudding' you can pass in the original
  # .password will pass it to bcrypt to digest it for you

  # password_digest - the naming is a convention of has_secure_password

  # .authenticate('pudding')
  # returns the user object if the password matches
  # else return false
end
