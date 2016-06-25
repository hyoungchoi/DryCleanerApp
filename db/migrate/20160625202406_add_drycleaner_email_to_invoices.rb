class AddDrycleanerEmailToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :drycleaner_email, :string
  end
end
