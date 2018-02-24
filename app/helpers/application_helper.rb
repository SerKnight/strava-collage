module ApplicationHelper

  def sample_quotes
    return [
      "People say nothing is impossible, but I do nothing all the time.",
      "Failure is the condiment that gives success its flavor.",
      "Huscle for that Muscle",
      "I want a hot body, but I also want tacos.",
      "The only running I hate is running out of money.",
      "Always remember that you are absolutely unique. Just like everyone else.",
      "Friends don't let friends skip leg day.",
      "I'm into fittness.. Fitness whole dick in my mouth."
    ].sample
  end

  def get_current_athlete
    uri = URI.parse("https://www.strava.com/api/v3/athlete?access_token=#{session[:access_token]}")
    response = Net::HTTP.get_response(uri)
    return JSON.parse(response.body)
  end

  def get_activities_with_photos(activity_id)
    uri = URI.parse("https://www.strava.com/api/v3/activities/#{activity_id}/photos?photo_sources=true&access_token=#{session[:access_token]}")
    response = Net::HTTP.get_response(uri)
    parsed = JSON.parse(response.body)
    activities = []
    parsed.each do |p|
      activities << [ caption: p['activity_name'].strip, src: format_image(p['urls']['0']) ]
    end
    return activities.flatten
  end

  def format_image(url)
    puts "url-> #{url}"
    return url.gsub('-64x17.jpg','-2048x572.jpg')
    .gsub('-48x63.jpg','-1536x2047.jpg')
    .gsub('-48x64.jpg','-1536x2048.jpg')
    .gsub('-64x48.jpg','-2048x1536.jpg')
    .gsub('-64x15.jpg','-2048x504.jpg') 
    .gsub('-35x64.jpg','-1150x2048.jpg') 
    .gsub('-36x64.jpg','-1152x2048.jpg')
    # https://dgtzuqphqg23d.cloudfront.net/GoR6qj-QRKEujNpJql7mBhQnBTEs22qaDJi0J-bVV_k-48x64.jpg
    # -1536x2048.jpg
  end


  def list_athlete_activities
    uri = URI.parse("https://www.strava.com/api/v3/athlete/activities?photo_sources=true&access_token=#{session[:access_token]}")
    response = Net::HTTP.get_response(uri)
    parsed = JSON.parse(response.body)
    activities = parsed.reject {|p| p["total_photo_count"] == 0 }
    return activities
  end

end
