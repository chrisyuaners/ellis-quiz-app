class SessionsController < ApplicationController
  def index
    sessions = Session.all
    render json: sessions
    # render json: SessionSerializer.new(sessions).to_serialized_json
  end

  def create
    new_session = Session.create(session_params)
    new_session_cards = SessionCard.add_cards(new_session.id)
    render json: new_session
  end

  def show
    session = Session.find(params[:id])
    render json: session
  end

  def update
    if params.key?("right")
      boolean = true
    else
      boolean = false
    end
    session = Session.find(params[:id])
    session.update(session_params)
    new_answer = Answer.create(user_id: session.user_id, card_id: params[:card_id], correct: boolean)
    render json: session
  end

  private

  def session_params
    params.require(:session).permit(:user_id, :right, :wrong)
  end
end
