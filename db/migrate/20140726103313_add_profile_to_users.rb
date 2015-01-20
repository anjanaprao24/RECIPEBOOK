class AddProfileToUsers < ActiveRecord::Migration
  def change 
   add_column :users , :address , :text
   add_column :users , :hobbies , :text
  end
end
