class GpsDataController < ApplicationController
  def create
    gps_file = GpsData.new(gps_params)

    if gps_file.save
      redirect_to :back, notice: 'GPS data uploaded'
    else
      puts gps_file.errors.full_messages.each { |message| puts message }
      redirect_to :back, alert: 'Data upload failed'
    end
  end

  private
  def gps_params
    id = params.delete(:id)
    params[:event_id] = id
    params.permit(:event_id, :user_id, :file)
  end
end
