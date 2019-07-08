class SessionCardsController < ApplicationController
  def index
    session_cards = SessionCard.all
    render json: SessionCardSerializer.new(session_cards).to_serialized_json
  end
  
  def create
    new_session_card = SessionCard.create(session_card_params)
    render json: new_session_card
  end

  private

  def session_card_params
    params.require(:session_card).permit(:session_id, :card_id)
  end
end
