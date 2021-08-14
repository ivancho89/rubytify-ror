module Api

  module V1

    class ArtistsController < ApplicationController

      def index

        artists_list = Artist.all
                              .order(popularity: :desc)

        render json: {
          data: artists_list,
        }, status: :ok
      end
    

      def albums
        render json: {
          data: "hello world 2",
        }, status: :ok
      end
    end
  end
end