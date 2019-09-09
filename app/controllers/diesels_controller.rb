class DieselsController < JSONAPI::ResourceController
  before_action :authenticate_user!

  def index
    render :json => Diesel.all
  end
end
