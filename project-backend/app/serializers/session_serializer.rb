class SessionSerializer < ActiveModel::Serializer
  attributes :id, :user, :right, :wrong
  has_many :cards, include_nested_associations: true

end
