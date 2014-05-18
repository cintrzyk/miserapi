module V1
  class SurveysController < AuthenticatedController
    expose(:surveys) { current_user.surveys }
    expose :survey, attributes: :survey_params

    def index
      render json: surveys
    end

    def create
      survey.user = current_user
      if survey.save
        render json: survey, status: :created
      else
        render json: { errors: survey.errors }, status: :unprocessable_entity
      end
    end

    private

    def survey_params
      params.require(:survey).permit :name
    end
  end
end
