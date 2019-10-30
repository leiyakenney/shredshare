class RtdLocationCreator

  def create_record(rtd_locations_data)
    parsed_data = JSON.parse(rtd_locations_data)
    parsed_data.map do |data|
      data[1].map do |location|
        parsed_data = JSON.parse(location, symbolize_names: true)

        city = data[0]
        name = parsed_data[:name]
        address = parsed_data[:address]
        RtdLocation.create!(area: city, name: name, address: address)
      end
    end
  end
end
