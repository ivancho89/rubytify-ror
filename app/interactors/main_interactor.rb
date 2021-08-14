class MainInteractor
  include Interactor

 # In user defined base classes, abstract methods should raise this exception when they
 # require derived classes to override the method, or while the class is being developed to
 # indicate that the real implementation still needs to be added.
  def call
    raise NotImplementedError
  end

  def on_success(record)
    record
  end

  def not_found
    context.fail!(error: 'This artist does not exist')
  end

  def insert_record(model: nil, resource: '', params: {})

    record = find_by_spotifyId(resource, params[:spotify_id])
    if record.blank?
      model.assign_attributes(params)
      model.save ? on_success(model) : context.fail!(error: model.errors.to_s)
    else
      on_success(record)
    end
  end

  def find_by_spotifyId(resource, spotify_id)
    resource.to_s.capitalize
                 .constantize.find_by(spotify_id: spotify_id)
  end
end