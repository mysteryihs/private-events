class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(name: params[:session][:name].downcase)
  	if user
  		flash[:success] = 'Thank you for signing in!'
  		cookies.permanent[:remember] = user.name
  		self.current_user = user
  		redirect_to root_path
  	end
  end

  def destroy
  end
end
