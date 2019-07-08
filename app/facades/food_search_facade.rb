class FoodSearchFacade
  def initialize(q)
    @q = q
  end

  def foods
    food_data = data_api_service.search_data(q)
    food_data[:item][0..9].map do |food|
      Food.new(food)
    end
  end

  def search_name
    q
  end

  def count
    total = data_api_service.search_data(q)
    total[:total]
  end

  private

  attr_reader :q

  def data_api_service
    DataApiService.new
  end
end
