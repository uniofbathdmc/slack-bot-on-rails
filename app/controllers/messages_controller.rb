class MessagesController < ApplicationController
  
  def index
    data = { id: 1, message: Rails.cache.read(1) }
  end
  
  def index_ten
    data = (1..10).map do |i|
      { id: i, message: Rails.cache.read(i) }
    end
    render json: data
  end
end
