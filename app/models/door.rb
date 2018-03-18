class Door < ApplicationRecord
  belongs_to :material
  has_many :orders
  validates :name, :description, :min_price, :width,
            :height, :photo, presence: true
  def self.search(search_params)
    if search_params
      @price_range = search_params[:price].split('-').map(&:to_i)
      @min = @price_range[0]
      @max = @price_range[1]
      search_params[:materials] ||= []
      if search_params[:materials].any?
        @doors = Door.where(material_id: search_params[:materials], min_price: @min..@max)
      else
        @doors = Door.where(min_price: @min..@max)
      end
    else
      Door.all
    end
  end
end
