class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def start
    if session[:access_token]
      redirect_to '/collage'
    end
  end

  def strava_auth
    query =  {  client_id: 23674,
                redirect_uri:  'http://localhost:3000/strava/redirect',
                response_type: 'code',
                approval_prompt: 'auto',
                scope: 'public'
              }
    redirect_to "https://www.strava.com/oauth/authorize?"+query.to_query
  end

  def strava_auth_redirect
    query = { client_id: 23674,
             client_secret: "acbfd66b54fcd1f422406ffb2fb6df8ba5be1b7f",
             code: params["code"]
            }
    uri = URI.parse("https://www.strava.com/oauth/token")
    res = Net::HTTP.post_form(uri, query)
    ca = JSON.parse(res.body)

    session[:access_token] = ca["access_token"]

    redirect_to collage_path
  end


  def collage
    if !session[:access_token]
      redirect_to root_path and return
    end
    
    @ca = get_current_athlete
    activity_ids = list_athlete_activities.map{|a| a["id"] }

    @photos = []
    activity_ids.each do |activity_id|
      @photos << get_activities_with_photos(activity_id)
    end

    # @activities = @ca.activities
    # https://www.strava.com/api/v3/activities/:id/photos?photo_sources=true
  end

end
