desc "Fetch workouts"
task fetch_workouts: :environment do
  require 'nokogiri'
  require 'open-uri'

  url = "http://www.crossfitmagnus.com/category/workout/"
  doc = Nokogiri::HTML(open(url))

  doc.css('article').each do |article|
    # Get workout date
    header = article.at_css(".entry-title a").text
    arr = header.split(" ")
    if arr[0] == "Workout"
      arr.shift(2)
    elsif arr[0] == "Open"
      arr.shift(3)
    else
      arr=["25", "June", "1986"]
    end
    date = arr.join(" ").to_date

    # Create new workout
    if date.year != 1986
      body = article.at_css(".entry-content p").text
      puts body
      puts "=========================="
      puts &nbsp
      # Workout.create(date: date)
    end

  end
end
