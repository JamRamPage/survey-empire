class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  include ActionController::Live

  def surveyReact
    survey_id = params['survey']
    survey = Survey.where(:id => survey_id).first
    puts params['like']
    if params['like'] == "true" then
      puts 'liking'
      puts survey
      puts survey.id
      survey.likes = survey.likes + 1
    else
      puts 'disliking'
      puts survey
      puts survey.id
      puts survey.survey_name
      survey.dislikes = survey.dislikes + 1
    end
    survey.save
  end

  # GET /surveys
  # GET /surveys.json
  def index
    if params['drafts'] == 'true' then
      puts 'showing surveys belonging to current user'
      @surveys = Survey.where(:user_id => current_user)
    else
      puts 'showing all public surveys'
      @surveys = Survey.where(:public => true)
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    if params['answered'] == 'true' or params['belongsToUser'] == 'true' or params['analyse'] == 'true' then
      @questions = @survey.questions
      puts 'showing survey'
    else
      puts 'showing form to answer survey'
    end
  end

  # GET /surveys/1/survey_analytics
  def survey_analytics
    puts 'analysing survey'
    @questions = @survey.questions

    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 3000, event: "updateTables")

    qIndex = 1
    for question in @questions
      totalAnswers = question.question_answers.size
      listOfAnswers = []
      countOfAnswers = []
      percentageForAnswers = []
      correctOptions = []
      timesTaken = [0,0,0,0] #For now, this will be the NUMBER of users who
      #submitted their answers within time frames like so:
      # < 10s, 10-30s, 30-50s, >50s
      for option in question.question_options
        if option.correct == true then
          correctOptions.push(option.optionString)
        end
      end
      ## Sum up questionOptionSelections relating to the question if multipleChoice
      if question.multipleChoice == true then
        #loop through and count selections of each option
        for option in question.question_options
          listOfAnswers.push(option.optionString)
          countOfAnswers.push(0)
          puts countOfAnswers
        end
        for questionAnswer in question.question_answers
          timeTaken = questionAnswer.created_at - questionAnswer.timeStarted
          if timeTaken < 10 then
            timesTaken[0] = timesTaken[0] + 1
          elsif timeTaken < 30 then
            timesTaken[1] = timesTaken[1] + 1
          elsif timeTaken < 50 then
            timesTaken[2] = timesTaken[2] + 1
          else
            timesTaken[3] = timesTaken[3] + 1
          end
          if questionAnswer.question_option_selections.first != nil
            for optionSelection in questionAnswer.question_option_selections
              selectionString = QuestionOption.where(:id => optionSelection.question_option_id).first.optionString
              index = listOfAnswers.index(selectionString)
              countOfAnswers[index] = countOfAnswers[index] + 1
            end
          end
        end
      else
        #loop through ANSWERS and count given answers
        for questionAnswer in question.question_answers
          timeTaken = questionAnswer.created_at - questionAnswer.timeStarted
          if timeTaken < 10 then
            timesTaken[0] = timesTaken[0] + 1
          elsif timeTaken < 30 then
            timesTaken[1] = timesTaken[1] + 1
          elsif timeTaken < 50 then
            timesTaken[2] = timesTaken[2] + 1
          else
            timesTaken[3] = timesTaken[3] + 1
          end
          answerString = questionAnswer.givenAnswer.downcase
          index = listOfAnswers.index(answerString)
          if index != nil then
            countOfAnswers[index] = countOfAnswers[index] + 1
          else
            listOfAnswers.push(answerString)
            countOfAnswers.push(1)
          end
        end
      end
      #calculate percentages for each answer using
      #count/totalAnswers
      for count in countOfAnswers
        percentageForAnswers.push((100 * count.to_f/totalAnswers.to_f))
      end
      #now we'll write the question details to the stream

      sse.write({"questionTitle#{qIndex}".to_sym => question.questionString})
      sse.write({"totalAnswers#{qIndex}".to_sym => question.question_answers.size})
      sse.write({"multipleChoice#{qIndex}".to_sym => question.multipleChoice})
      sse.write({"multipleAnswer#{qIndex}".to_sym => question.multipleAnswer})
      sse.write({"listOfAnswers#{qIndex}".to_sym => listOfAnswers})
      sse.write({"countOfAnswers#{qIndex}".to_sym => countOfAnswers})
      sse.write({"percentageForAnswers#{qIndex}".to_sym => percentageForAnswers})

      qIndex = qIndex + 1
    end
    sse.write({"numberOfQuestions".to_sym => @questions.size})
  ensure
    response.stream.close
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:survey_name, :public, :creationDate, :expiryDate, :likes, :dislikes, :user_id,
      :questions_attributes => [:id, :survey_id, :questionString, :multipleChoice, :multipleAnswer, :created_at, :updated_at, :_destroy,
        :question_options_attributes => [:id, :question_id, :optionString, :correct, :created_at, :updated_at, :_destroy]]
      )
    end
end
