class SignupsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable

    # def index 
    #     signups = Signup.all 
    #     render json: signups
    # end

    def create 
        signup = Signup.create!(signup_params)
        render json: Activity.find(signup.activity_id), status: :created 
    end

    private 

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
