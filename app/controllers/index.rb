get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/company_page/:id' do
  @company = Company.find(params[:id])
  historical_prices = @company.prices
  
  @array_of_dates_and_prices = [['date','price']]
  historical_prices.each do |object| 
    @array_of_dates_and_prices << [object.date.to_s, object.price] 
  end 
  
  erb :company_page
end

