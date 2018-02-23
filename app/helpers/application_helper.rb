module ApplicationHelper


  def get_current_athlete(access_token)
    @ca ||= Strava::Athlete.current_athlete(access_token)
  end
end
