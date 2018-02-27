Rails.application.routes.draw do
  root 'activities#start' 
  
  get '/strava/auth' => 'application#strava_auth'
  get '/strava/redirect' => 'application#strava_auth_redirect'
  
  get '/collage' => 'activities#collage'
end

