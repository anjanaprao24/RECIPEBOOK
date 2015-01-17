class WelcomeMailerController < ApplicationController


  def welcome
  email=params[:email]
  body=params[:body]
  WelcomeMailer.welcome(email,body).deliver
  redirect_to home_recipes_path, :notice => "Recipe shared!"
  end


end
