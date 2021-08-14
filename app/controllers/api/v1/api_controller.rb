
module Api
    module V1
      class ApiController < ApplicationController
    
        def assign_resource
            puts "params! #{params}" 
            resource_name = controller_name.singularize
            resource = controller_name.classify.constantize.find(params[:artist_id])
            instance_variable_set("@#{resource_name}", resource)
        end
  
        def serialize_response(query)
          ActiveModelSerializers::SerializableResource.new(query)
        end
      end
    end
  end