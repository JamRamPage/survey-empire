class RatingsController < ApplicationController
    before_action :find_survey
    before_action :authenticate_user!

    def create
        if already_rated?
            flash[:notice] = "You can't rate again"
        else
            @rating = @survey.ratings.create(rating_params)
            if @rating.rating_value.is_a? Integer
                if @rating.rating_value > 5
                    @rating.rating_value = 5
                elsif @rating.rating_value < 0
                    @rating.rating_value = 0
                end
                @rating.user_id = current_user.id
                @rating.survey_id = @survey.id
                if @rating.save
                    head :no_content
                else
                    redirect_to root_path
                end
            else
                flash[:notice] = "Needs to be an Integer" 
            end
        end
        
    end
    
    private
        def rating_params
            params.permit(:rating_value)
        end

        def find_survey
            @survey = Survey.find(params[:survey_id])
        end

        def already_rated?
            Rating.where(user_id: current_user.id, survey_id: params[:survey_id]).exists?
        end   
end