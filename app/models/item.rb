class Item < ActiveRecord::Base
  attr_accessible :item_name, :category_id , :pic , :description
  belongs_to :category
  belongs_to :user
  has_attached_file :pic, :styles => 
           { :medium => "300x300>", :thumb => "100x100>" }
  do_not_validate_attachment_file_type :pic
end
