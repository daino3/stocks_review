get '/buy_stock' do 
  erb :stock_list
end

post '/buy_stock/:company_id' do
  company = Company.find(params[:company_id])
  share_price = company.prices.last.price
  num_shares = params[:quantity].to_i
  balance = current_user.balance.to_i
  # puts company, share_price, num_shares, balance
  
  if balance > share_price*num_shares
    Trade.create(shareholder_id: current_user.id, 
                 company_id: company.id, 
                 price_paid: share_price, 
                 shares: num_shares)
    previous_balance = current_user.balance 
    current_user.update(balance: previous_balance - num_shares*share_price)
    erb :user_page
  else
    @funds_error = "Insufficient Funds"
    erb :stock_list
  end
end

get '/get_data' do
  puts params.keys.first
  @company = Company.find_by_name(params.keys.first)
  erb :_buy_form, layout: false
end

post '/sell_stock' do
end
