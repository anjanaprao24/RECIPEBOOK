class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :address , :hobbies, :pic
  # attr_accessible :title, :body

  has_attached_file :pic, :styles => 
           {:thumb => "100x100>" }
  do_not_validate_attachment_file_type :pic


end

