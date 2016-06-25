class AddCustomerEmailToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :customer_email, :string
  end
end
