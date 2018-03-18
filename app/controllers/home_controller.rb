class HomeController < ApplicationController
  def index
    @doors = Door.order(created_at: :desc).limit(6)
  end
end
