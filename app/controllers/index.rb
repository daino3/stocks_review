get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do

end

post '/create_new_user' do
  if request.xhr?
    p params
    @new_user = User.create(params[:info])
  else
    @new_user = User.create(params[:info])
  end
end 
