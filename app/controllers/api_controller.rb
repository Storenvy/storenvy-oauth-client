class ApiController < ApplicationController
  respond_to :json

  def explore
    @json = storenvy_access_token.get("/v1/#{params[:api]}").parsed
    respond_with @json
  end
end
