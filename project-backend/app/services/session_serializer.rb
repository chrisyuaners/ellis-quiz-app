class SessionSerializer
  def initialize(session_obj)
    @session = session_obj
  end

  def to_serialized_json
    @session.to_json(include: {
      user: {only: [:name]},
      cards: {include: [:choices], except: [:created_at, :updated_at]}
      }, :except => [:created_at, :updated_at])
  end
end
