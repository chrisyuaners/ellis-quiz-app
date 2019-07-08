class SessionCard < ApplicationRecord
  belongs_to :session
  belongs_to :card

  def self.add_cards(id)
    Card.all.each do |card|
      self.create(session_id: id, card_id: card.id)
    end
  end
end
