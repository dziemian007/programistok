class AdminsController < ApplicationController

  def show
    @admin = Admin.find(params[:id])
		@title = @admin.email		
  end

end


