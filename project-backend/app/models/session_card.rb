class SessionCard < ApplicationRecord
  belongs_to :session
  belongs_to :card
end
