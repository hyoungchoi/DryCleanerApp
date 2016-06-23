class AddDrycleanerIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :drycleaner_id, :int
  end
end
