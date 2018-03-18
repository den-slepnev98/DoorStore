class Order < ApplicationRecord
  belongs_to :door
  belongs_to :material
  validates :width, :height, :door_opening, :comment,
            :user_name, :user_phone, :user_email, presence: true
end
