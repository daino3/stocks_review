post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    erb :user_page
  else
    @login_error = "Invalid Login"
    erb :index
  end
end

post '/create_new_user' do
    @new_user = User.create(params[:info])
    session['user_id'] = @new_user.id
    erb :user_page
end 

get '/logout' do
  session.clear 
  redirect to('/')
end

get '/user_page' do
  erb :user_page
end
