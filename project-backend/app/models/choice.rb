class Choice < ApplicationRecord
  has_many :card_choices
  has_many :cards, through: :card_choices
end
