class Session < ApplicationRecord
  belongs_to :user
  has_many :session_cards
  has_many :cards, through: :session_cards

end
