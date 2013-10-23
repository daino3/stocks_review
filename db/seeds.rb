require 'nokogiri'
require 'open-uri'
require 'faker'

#----------- Company / Price ----------------#

company = "Yelp"
industry = "Tech"
ticker = "YELP"
url = 'http://www.google.com/finance/historical?q=NYSE%3AYELP&ei=nPNnUvCiBImXrAGGxQE'

doc = Nokogiri::HTML(open(url))

array_of_dates_and_prices = []
hash = {}
doc.css('tr').each do |row|
 array_of_dates_and_prices << [row.css('td:nth-child(1)').text.chomp, row.css('td:nth-child(5)').text.chomp]
end

array_of_dates_and_prices.shift(5);

#   array_of_dates_and_prices.each do |array|
#   print array, "\n"
# end

yelp = Company.create(name: company, industry: industry, ticker: ticker)

array_of_dates_and_prices.each do |sub_array|
  Price.create(company_id: yelp.id, date: sub_array[0], price: sub_array[1])
end

#----------- Company / Price ----------------#

company = "Google"
industry = "Tech"
ticker = "GOOG"
url = 'http://www.google.com/finance/historical?q=NASDAQ%3AGOOG&ei=YVdoUoCLJtGfqwHDoAE'

doc = Nokogiri::HTML(open(url))

array_of_dates_and_prices = []
hash = {}
doc.css('tr').each do |row|
 array_of_dates_and_prices << [row.css('td:nth-child(1)').text.chomp, row.css('td:nth-child(5)').text.chomp]
end

array_of_dates_and_prices.shift(5);

google = Company.create(name: company, industry: industry, ticker: ticker)

array_of_dates_and_prices.each do |sub_array|
  Price.create(company_id: google.id, date: sub_array[0], price: sub_array[1])
end

#----------- Company / Price ----------------#

company = "Apple"
industry = "Tech"
ticker = "AAPL"
url = 'http://www.google.com/finance/historical?q=NASDAQ%3AAAPL&ei=j1doUoDHEoi3qgHhcw'

doc = Nokogiri::HTML(open(url))

array_of_dates_and_prices = []
hash = {}
doc.css('tr').each do |row|
 array_of_dates_and_prices << [row.css('td:nth-child(1)').text.chomp, row.css('td:nth-child(5)').text.chomp]
end

array_of_dates_and_prices.shift(5);

apple = Company.create(name: company, industry: industry, ticker: ticker)

array_of_dates_and_prices.each do |sub_array|
  Price.create(company_id: apple.id, date: sub_array[0], price: sub_array[1])
end

#----------- Company / Price ----------------#

company = "Tesoro"
industry = "Energy"
ticker = "TSO"
url = 'http://www.google.com/finance/historical?q=NYSE%3ATSO&ei=qVdoUsjbLYW2qgGNGA'

doc = Nokogiri::HTML(open(url))

array_of_dates_and_prices = []
hash = {}
doc.css('tr').each do |row|
 array_of_dates_and_prices << [row.css('td:nth-child(1)').text.chomp, row.css('td:nth-child(5)').text.chomp]
end

array_of_dates_and_prices.shift(5);

tesoro = Company.create(name: company, industry: industry, ticker: ticker)

array_of_dates_and_prices.each do |sub_array|
  Price.create(company_id: tesoro.id, date: sub_array[0], price: sub_array[1])
end

#----------- USERS ----------------#

10.times do 
  User.create(username: Faker::Name.name, password: 'blah', password_confirmation: 'blah', email: Faker::Internet.email, balance: 100)
end

#----------- TRADES ----------------#

companies  = [tesoro, google, apple, yelp]

50.times do 
  Trade.create(shareholder_id: User.find(rand(1..10)).id, company_id: companies[rand(1..companies.length-1)].id, price_paid: rand(20..60), shares: rand(50..100))
end


