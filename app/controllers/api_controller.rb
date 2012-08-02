class ApiController < ApplicationController
  respond_to :json

  def explore
    begin
      if storenvy_access_token.nil?
        @json                  = { message: "Your session has expired. Please log out and back into this client app." }
        session[:user_id]      = nil
        session[:access_token] = nil
      end
      @json = storenvy_access_token.get("/v1/#{params[:api]}.json#{aggregate_params}").parsed
    rescue => e
      @json = { message: "An Oauth excecption occurred. You may have requested something you don't have access to." }
    end
    respond_with @json
  end

  # HACK
  def aggregate_params
    param_str = '?'
    request.query_parameters.each do |param|
      param_str += "#{param.first}=#{param.second.gsub('.json','')}&"
    end
    param_str
  end
end
