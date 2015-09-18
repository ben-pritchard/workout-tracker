require 'nokogiri'
require 'open-uri'

url = "http://www.crossfitmagnus.com/category/workout/"
doc = Nokogiri::HTML(open(url))

doc.css('article').each do |article|
  # puts article.at_css(".entry-title a").text
  header = article.at_css(".entry-title a").text
  puts header.split(" ")[2,3].to_s.to_date
end

# doc.xpath('//article').each do |article|
#   puts article.content
# end
