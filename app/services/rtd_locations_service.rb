class RtdLocationsService

  def self.rtd_locations
    conn = Faraday.new(:url => 'https://shred-share-api.herokuapp.com')
    conn.get '/rtd_locations/index'
  end
  
end
