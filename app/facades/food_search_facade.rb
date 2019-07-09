class FoodSearchFacade
  attr_reader :food_query

  def initialize(food_query)
    @food_query = food_query
  end

  def foods
    food_data[:item].map {|food| Food.new(food)}
  end

  def count
    food_data[:total]
  end

  private

  def food_data
    @_food_data ||= data_api_service.search_data(food_query)
  end

  def data_api_service
    DataApiService.new
  end
end
