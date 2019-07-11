class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :correct, :card
  has_one :user
  has_one :card
end
