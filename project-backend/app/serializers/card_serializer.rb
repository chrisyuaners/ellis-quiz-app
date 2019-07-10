class CardSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :description, :choices, :category
end
