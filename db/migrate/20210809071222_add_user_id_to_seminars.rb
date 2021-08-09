class AddUserIdToSeminars < ActiveRecord::Migration[5.2]
  def change
    add_column :seminars, :user_id, :integer
  end
end
