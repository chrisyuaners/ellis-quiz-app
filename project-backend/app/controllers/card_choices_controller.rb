class CardChoicesController < ApplicationController
  def index
    card_choices = CardChoice.all
    render json: card_choices
  end
end
