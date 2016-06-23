class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :quantity
      t.decimal :amount
      t.integer :invoice_id
    end
  end
end
