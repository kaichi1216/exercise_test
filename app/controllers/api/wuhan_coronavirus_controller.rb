class Api::WuhanCoronavirusController < Api::BaseController

  def index
    result_hash = RedisService.get_wuhan_vote_result
    render json: { yes: result_hash["yes"].to_i, no: result_hash["no"].to_i}, status: :ok
  end

  def create
    #check return params value
    unless params[:res] == 0 || params[:res] == 1
      render json: { message: "Error vote type." }, status: :bad_request
      return
    end

    RedisService.cast_a_vote(params[:res])
    render json: { message: "Success."}, status: :accepted
  end

end
