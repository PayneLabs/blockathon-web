class RemoveUseRReference < ActiveRecord::Migration[5.2]
  def change
  	remove_column :documents, :user_id
  end
end
