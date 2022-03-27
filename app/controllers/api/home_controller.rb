class Api::HomeController < Api::BaseController

  def index
    render json: { message: 'hi'}, status: :ok
  end
end
