class ActivitiesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        activity = Activity.all 
        render json: activity
    end

    def destroy 
        activity = find_activity
        activity.destroy
    end

    private 

    def find_activity
        Activity.find(params[:id])
    end

    def render_not_found
        render json: {error: 'Activity not found'}, status: :not_found
    end

end
