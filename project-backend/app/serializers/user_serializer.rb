class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :answers, include_nested_associations: true
end
