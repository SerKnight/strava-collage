class ActivitiesController < ApplicationController
  include ActivitiesHelper

  before_action :get_current_athlete

  def start
    if session[:access_token]
      redirect_to '/collage'
    end
  end

  def collage
    if !session[:access_token]
      redirect_to root_path and return
    end

    @quote = sample_quotes
    @activities = recent_activities
  end
end
