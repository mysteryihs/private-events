module SessionsHelper
	def current_user=(user)
  	@current_user = user
  end

  def current_user
  	@current_user ||= User.find_by(name: cookies[:remember])
  end

  def signed_in?
  	!current_user.nil?
  end
end
