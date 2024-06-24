class AddStatusToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :sales_status, :integer
  end
end
