class AddImageToShares < ActiveRecord::Migration[6.1]
  def change
    add_column :shares, :image, :string
  end
end
