desc "Fetch workouts"
task fetch_workouts: :environment do
  require 'nokogiri'
  require 'open-uri'

  page = 0
  date = nil
  last_workout = "2 Oct 2014".to_date

  loop do
    page += 1
    if page == 1
      url = "http://www.crossfitmagnus.com/category/workout/"
    else
      url = "http://www.crossfitmagnus.com/category/workout/page/#{page}/"
    end

    doc = Nokogiri::HTML(open(url))

    # Replace <br> with "\n" so that a carriage return is picked up when converted to plain text
    # doc.css('article br').each{ |br| br.replace "\n" }

    doc.css('article').each do |article|
      # Get workout date
      header = article.at_css(".entry-title a").text
      date_arr = header.split(" ")
      if date_arr[0] == "Workout"
        date_arr.shift(2)
      elsif date_arr[0] == "Open"
        date_arr.shift(3)
      else
        next
      end

      date = date_arr.join(" ").to_date

      # Get body of workout
      body = article.at_css(".entry-content p").text

      # Create new workout
      Workout.create(date: date, body: body)
    end
    break if date == last_workout
  end
end
