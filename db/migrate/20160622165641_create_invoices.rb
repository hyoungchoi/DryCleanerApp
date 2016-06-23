class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.decimal :subtotal
      t.decimal :total
      t.datetime :pickup

      t.timestamps null: false
    end
  end
end
