module ActionController
  class Responder
    protected

    def api_behavior(error)
      raise error unless resourceful?

      if get?
        display resource
      elsif post?
        display resource, :status => :created, :location => api_location
      elsif put?
        display resource
      else
        head :no_content
      end
    end
  end
end
