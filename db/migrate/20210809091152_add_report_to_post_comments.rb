class AddReportToPostComments < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :report, :string
  end
end
