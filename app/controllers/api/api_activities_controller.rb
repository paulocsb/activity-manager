class Api::ApiActivitiesController < ApplicationController

	def index
    render json: { time: '', description: '' }
  end

  def create
  	activities = params[:activities] != nil ? params[:activities].to_json : nil
  	
  	dsc = params[:activity].split(/[0-9][0-9]/)[0]
  	min = params[:activity].scan(/\d/).join.to_i

  	if(activities != nil)
  		activity = JSON.parse(activities).last
  		time = activity['time'].to_time + (activity['minutes_activity'].to_i * 60)
  		if(min == 0)
  			min = (60 - activity['time'].to_time.min)
  		else
  			if(time.hour > 11 && time.hour < 13)
  				time = Time.at((13*60)*60).utc
  			end
  		end
		else
			time = Time.at((9*60)*60).utc
  	end

  	if (time.hour <= 17)
			render json: { time: time.strftime("%H:%M").to_s, minutes_activity: min, description: dsc }
		else
			render json: { error: 'Expediente encerrado!' }, status: 500
		end
	end
end