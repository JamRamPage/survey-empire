class QuestionOptionsController < ApplicationController
  before_action :get_question_and_survey
  before_action :set_question_option, only: [:show, :edit, :update, :destroy]

  # GET /question_options
  # GET /question_options.json
  def index
    @question_options = @question.question_options
  end

  # GET /question_options/1
  # GET /question_options/1.json
  def show
  end

  # GET /question_options/new
  def new
    @question_option = @question.question_options.build
  end

  # GET /question_options/1/edit
  def edit
  end

  # POST /question_options
  # POST /question_options.json
  def create
    @question_option = @question.question_options.build(question_option_params)

    respond_to do |format|
      if @question_option.save
        format.html { redirect_to survey_question_question_options_path(@survey, @question), notice: 'Question option was successfully created.' }
        format.json { render :show, status: :created, location: @question_option }
      else
        format.html { render :new }
        format.json { render json: @question_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_options/1
  # PATCH/PUT /question_options/1.json
  def update
    respond_to do |format|
      if @question_option.update(question_option_params)
        format.html { redirect_to survey_question_question_options_path(@survey, @question), notice: 'Question option was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_option }
      else
        format.html { render :edit }
        format.json { render json: @question_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_options/1
  # DELETE /question_options/1.json
  def destroy
    @question_option.destroy
    respond_to do |format|
      format.html { redirect_to survey_question_question_options_path(@survey, @question), notice: 'Question option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_question_and_survey
      @question = Question.find(params[:question_id])
      @survey = Survey.find(@question.survey_id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_question_option
      @question_option = @question.question_options.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_option_params
      params.require(:question_option).permit(:question_id, :optionString, :correct)
    end
end
