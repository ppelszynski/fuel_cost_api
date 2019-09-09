class Pb95sController < JSONAPI::ResourceController
  before_action :authenticate_user!

  def index
    render :json => Pb95.all
  end
end
