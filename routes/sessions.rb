get '/login' do
  erb :login
end

post '/sessions' do
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

delete '/sessions' do
  # 1. destroy the session
  session[:user_id] = nil
  # 2. redirect
  redirect '/login'
end