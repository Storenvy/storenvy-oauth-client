class PagesController < ApplicationController
  
  def callback
    @code = params[:code]
    
    raise "code param is required" if @code.blank?
  end
end
