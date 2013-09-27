class ApiController < ActionController::Base

  def calls

    respond_to do |format|
      format.xml, layout: false
    end

  end



end


