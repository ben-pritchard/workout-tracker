require 'nokogiri'
require 'open-uri'

url = "http://www.crossfitmagnus.com/category/workout/"
doc = Nokogiri::HTML(open(url))

doc.css('article').each do |article|
  # puts article.at_css(".entry-title a").text
  header = article.at_css(".entry-title a").text
  arr = header.split(" ")
  arr.shift(2)
  date = arr.join(" ").to_date
  puts date
end

# doc.xpath('//article').each do |article|
#   puts article.content
# end
