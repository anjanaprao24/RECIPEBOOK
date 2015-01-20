class ApplicationController < ActionController::Base
  protect_from_forgery


   def after_sign_in_path_for(resource)
    if current_user.role=="user"
     home_recipes_path
       else
      home_categories_path
   end
  end

  def after_sign_up_path_for(resource)
   WelcomeMailer.welcome(@email).deliver
  end 

  def after_sign_out_path_for(resource)
   home_recipes_path
  end 

end
