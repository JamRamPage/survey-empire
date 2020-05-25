class QuestionAnswersController < ApplicationController
  before_action :get_question
  before_action :set_question_answer, only: [:show, :edit, :update, :destroy]

  # GET /question_answers
  # GET /question_answers.json
  def index
    @question_answers = QuestionAnswer.all
  end

  # GET /question_answers/1
  # GET /question_answers/1.json
  def show
  end

  # GET /question_answers/new
  def new
    @question_answer = QuestionAnswer.new
  end

  # GET /question_answers/1/edit
  def edit
  end

  # POST /question_answers
  # POST /question_answers.json
  def create
    @question_answer = QuestionAnswer.new(question_answer_params)
    @question_answer.timeEnded = DateTime.now
    #respond_to do |format|
      if @question_answer.save
        if @question.multipleChoice == true && @question.multipleAnswer == true then
          optionSelections = params[:question_answer][:selectedOptions] #The Id of the question_options the user selected
          optionSelections.each do |optionSelection|
            @question_option_selection = QuestionOptionSelection.new
            @question_option_selection.question_option_id = optionSelection
            @question_option_selection.question_answer_id = @question_answer.id
            @question_option_selection.save
          end
        elsif @question.multipleChoice == true then
          optionSelection = params[:question_answer][:selectedOption] #The Id of the question_option the user selected
          @question_option_selection = QuestionOptionSelection.new
          @question_option_selection.question_option_id = optionSelection
          @question_option_selection.question_answer_id = @question_answer.id
          @question_option_selection.save
        end
        # format.html { redirect_to survey_path(:survey_id), notice: 'Question answer was successfully created.' }
        # format.json { render :show, status: :created, location: @question_answer }
      else
        format.html { render :new }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    #end
    #redirect_to action: :
    
  end

  # PATCH/PUT /question_answers/1
  # PATCH/PUT /question_answers/1.json
  def update
    respond_to do |format|
      if @question_answer.update(question_answer_params)
        #format.html { redirect_to @question_answer, notice: 'Question answer was successfully updated.' }
        #format.json { render :show, status: :ok, location: @question_answer }
      else
        format.html { render :edit }
        format.json { render json: @question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_answers/1
  # DELETE /question_answers/1.json
  def destroy
    @question_answer.destroy
    respond_to do |format|
      format.html { redirect_to question_answers_url, notice: 'Question answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def get_question
      @question = Question.find(params[:question_answer][:question_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question_answer
      @question_answer = QuestionAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_answer_params
      #if @question.multipleChoice == true && @question.multipleAnswer == true then
        #params.require(:question_answer).permit(:question_id, :user_id, :givenAnswer, :timeStarted, :timeEnded, :survey_id, :selectedOptions)
      #elsif @question.multipleChoice == true then
        #params.require(:question_answer).permit(:question_id, :user_id, :givenAnswer, :timeStarted, :timeEnded, :survey_id, :selectedOption)
      #else
        params.require(:question_answer).permit(:question_id, :user_id, :givenAnswer, :timeStarted, :timeEnded, :survey_id)
      #end
    end
end
