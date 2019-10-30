require 'yaml'

namespace :import do
   desc "Add RTD Locations to Database"
   task rtd: :environment do

     location_data = RtdLocationsService.rtd_locations

     creator= RtdLocationCreator.new
     creator.create_record(location_data.body)

     p "Import Successful!"
   end
 end
