class Room < ApplicationRecord
  belongs_to :theater
  belongs_to :template

  def print_theater
    " Theater: #{theater.name} / Room: #{id} / Capacity: #{template.row * template.col}"
  end

  def tickets
    "#{template.row * template.col}"
  end

end
