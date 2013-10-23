

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  @user = User.find_by_username(params[:username])
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

get '/company_page/:id' do
  @company = Company.find(params[:id])
  erb :company_page
end
