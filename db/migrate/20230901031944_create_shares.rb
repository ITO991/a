class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.string :shop_name
      t.string :adress
      t.string :evaluation

      t.timestamps
    end
  end
end
