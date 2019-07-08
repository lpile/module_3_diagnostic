class DataApiService
  def search_data(q)
    params = {q: q, api_key: ENV['api_key']}
    fetch_data('/ndb/search/', params)
  end

  private

  def conn
    Faraday.new(url: 'https://api.nal.usda.gov') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)[:list]
  end
end
