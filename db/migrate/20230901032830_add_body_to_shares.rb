class AddBodyToShares < ActiveRecord::Migration[6.1]
  def change
    add_column :shares, :body, :text
  end
end
