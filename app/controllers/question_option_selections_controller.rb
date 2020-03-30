class QuestionOptionSelectionsController < ApplicationController
  before_action :get_question_answer
  before_action :set_question_option_selection, only: [:show, :edit, :update, :destroy]

  # GET /question_option_selections
  # GET /question_option_selections.json
  def index
    @question_option_selections = @question_answer.question_option_selections
  end

  # GET /question_option_selections/1
  # GET /question_option_selections/1.json
  def show
  end

  # GET /question_option_selections/new
  def new
    @question_option_selection = @question_answer.question_option_selection.build
  end

  # GET /question_option_selections/1/edit
  def edit
  end

  # POST /question_option_selections
  # POST /question_option_selections.json
  def create
    @question_option_selection = @question_answer.question_option_selection.build(question_option_selection_params)

    respond_to do |format|
      if @question_option_selection.save
        format.html { redirect_to @question_answer_question_option_selection_path(@question_answer), notice: 'Question option selection was successfully created.' }
        format.json { render :show, status: :created, location: @question_option_selection }
      else
        format.html { render :new }
        format.json { render json: @question_option_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_option_selections/1
  # PATCH/PUT /question_option_selections/1.json
  def update
    respond_to do |format|
      if @question_option_selection.update(question_option_selection_params)
        format.html { redirect_to @question_answer_question_option_selection_path(@question_answer), notice: 'Question option selection was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_option_selection }
      else
        format.html { render :edit }
        format.json { render json: @question_option_selection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_option_selections/1
  # DELETE /question_option_selections/1.json
  def destroy
    @question_option_selection.destroy
    respond_to do |format|
      format.html { redirect_to @question_answer_question_option_selection_path(@question_answer), notice: 'Question option selection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_question_answer
      @question_answer = QuestionAnswer.find(params[:question_answer_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_question_option_selection
      @question_option_selection = QuestionAnswer.question_option_selections.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_option_selection_params
      params.require(:question_option_selection).permit(:question_answer_id, :question_option_id)
    end
end
