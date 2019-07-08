class FoodsController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://api.nal.usda.gov') do |faraday|
      faraday.params['api_key'] = ENV['api_key']
      faraday.params['q'] = params['q']
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    response = conn.get('/ndb/search/')

    results = JSON.parse(response.body, symbolize_names: true)[:list][:item]
    search = JSON.parse(response.body, symbolize_names: true)[:list]

    @food_count = search[:total]
    @foods_search_name = params[:q]

    @foods = results[0..9].map do |result|
      Food.new(result)
    end
  end
end
