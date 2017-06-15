class Room < ApplicationRecord
  belongs_to :theater
  belongs_to :template
end
