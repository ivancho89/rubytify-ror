module Api

  module V1

    class AlbumsController < ApiController
      before_action :assign_resource, only: :songs

      def songs
        render json: { data: serialize_response(@album.songs) }, status: :ok
      end
    end
  end
end