class SessionCardSerializer
  def initialize(session_card_obj)
    @session_card = session_card_obj
  end

  def to_serialized_json
    @session_card.to_json(include: {
      card: {include: [:choices], except: [:created_at, :updated_at]},
      session: {only: [:user_id, :right, :wrong]}
      }, :except => [:created_at, :updated_at])
  end
end
