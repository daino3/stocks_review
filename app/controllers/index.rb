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
  # uri = URI.parse('http://finance.yahoo.com/rss/headline?s=GOOG')
  # Net::HTTP::Get.new(uri.path)
  # Net::HTTP.start(uri.host, uri.port) do |http|
  #   request = Net::HTTP::Get.new uri

  #   # response = http.request #request # Net::HTTPResponse object
  #   p request
  # end
  erb :company_page
end

