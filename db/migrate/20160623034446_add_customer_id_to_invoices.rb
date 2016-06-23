class AddCustomerIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :customer_id, :int
  end
end
