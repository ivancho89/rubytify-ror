require 'yaml'
namespace :db do

    desc 'Read YML file'
    task spotify_data: :environment do

        artistList = YAML.load(File.read("config/default_artists.yml"))

        artistList.values[0].each do |artist|

            puts "getting data for: #{artist}"

            reg_result = ArtistRegistration.call(artist_name: artist.to_s)

            puts "ERROR! #{reg_result.error}" if reg_result.failure?
            puts "Complete!" if reg_result.success?
        end


    end
end

