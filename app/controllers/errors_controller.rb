class ErrorsController < ApplicationController

  def page_not_found
    render layout: false
  end

end
