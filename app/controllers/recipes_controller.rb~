class RecipesController < ApplicationController


def home 
 @new_recipe=Item.find(:all , :order => "created_at DESC", :limit => 3)
 @most_liked=Item.find(:all , :order => "likes DESC" , :limit => 3)
end

def view_category
  @categories= Category.all
end

def view_recipe
  @item= Item.all
end

def my_recipe
  if current_user
  @recipe = Item.where(:user_id => current_user.id)
end
end

def profile
 if !current_user
  redirect_to home_recipes_path , :notice=>"Log in to view profile!"
 end
end

def updateprofile
 @email=params[:email]
 @address=params[:address]
 @hobbies=params[:hobbies]
 @pic=params[:pic]
 @user= User.where(:email=>current_user.email)
 if @user
 @user.update_all(:address => @address , :email=>@email , :hobbies =>@hobbies)
 
 end
end

end

