module Api

  module V1

    class ArtistsController < ApiController
      before_action :assign_resource, only: :albums

      def index

        artists_list = Artist.all
                              .order(popularity: :desc)

        render json: { data: serialize_response(artists_list) }, status: :ok

      end
    

      def albums

        albums_list = @artist.albums

        render json: { data: serialize_response(albums_list) }, status: :ok

      end
    end
  end
end