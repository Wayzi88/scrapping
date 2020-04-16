require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"


def create_array_name_currency

  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  cryptoName = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[position()<100]/td[3]')
  cryptoCurrency = page.xpath('/html/body/div/div/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[position()<100]/td[5]')


  name_array = []
  cryptoName.each {|name| name_array << name.text }

  currency_array = []
  cryptoCurrency.each {|currency| currency_array << currency.text} 

  nameAndCurrency = Hash[name_array.zip currency_array]

  finalArray = nameAndCurrency.map { |k, v| { k => v } }
  
  return finalArray
 
end

puts create_array_name_currency