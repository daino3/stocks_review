get '/buy_stock' do 
  erb :stock_list
end

post '/buy_stock/:company_id' do
  company = Company.find(params[:company_id])
  share_price = company.prices.last.price
  num_shares = params[:quantitiy].to_i
  balance = current_user.balance.to_i
  puts company, share_price, num_shares, balance
  
  if balance > share_price*num_shares
    Trade.create(shareholder: current_user.id, 
                 company: company.id, 
                 price_paid: share_price, 
                 num_shares: num_shares)
  else
    #Print Error Message on Screen
  end
end
