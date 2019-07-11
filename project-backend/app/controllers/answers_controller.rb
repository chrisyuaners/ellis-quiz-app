class AnswersController < ApplicationController
  def index
    answers = Answer.all
    render json: answers
  end

  def create
    new_answer = Answer.create(answer_params)
    render json: new_answer
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :card_id, :correct)
  end
end
