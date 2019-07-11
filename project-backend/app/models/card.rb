class Card < ApplicationRecord
  has_many :session_cards
  has_many :sessions, through: :session_cards
  has_many :card_choices
  has_many :choices, through: :card_choices
  has_many :answers

end
