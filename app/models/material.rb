class Material < ApplicationRecord
  has_many :doors
  has_many :orders
end
