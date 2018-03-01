get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])

  # this line protects the unauthorized showing of user data
  redirect '/' unless @user.id == session[:user_id]

  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    puts "user saved"
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end
