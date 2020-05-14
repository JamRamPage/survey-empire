class SurveyAnalysisController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  include ActionController::Live

  def analyse_survey
    puts 'analysing survey'
    puts @survey = Survey.find(12)
    puts request.original_url
    @questions = @survey.questions

    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 10000, event: "updateTables")
    sse.write({testVal: 100 * rand})
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

      sse.write({'id'.to_sym => question.questionString , 'totalAnswers'.to_sym => question.question_answers.size, 'multipleChoice'.to_sym => question.multipleChoice, 'multipleAnswer'.to_sym => question.multipleAnswer, 'listOfAnswers'.to_sym => listOfAnswers, 'countOfAnswers'.to_sym => countOfAnswers, 'percentageForAnswers'.to_sym => percentageForAnswers   } )

      qIndex = qIndex + 1
    end
    sse.write({"numberOfQuestions".to_sym => @questions.size})
  ensure
    response.stream.close
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(12)
    end

end
