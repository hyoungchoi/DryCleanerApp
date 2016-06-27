class ItemsController < ApplicationController
  before_action :find_invoice
	before_action :find_item, only: [:edit, :update, :destroy]
	
	def new
		@item = Item.new
	end

	def create
		@item = @invoice.items.create(item_params)
		@item.invoice_id = @invoice.id

		if @item.save
			redirect_to invoice_path(@invoice)
		else
			render 'new'
		end
	end
	
	def edit
	end

	def update
		if @item.update(item_params)
			redirect_to drycleaner_invoice_path(current_user, @invoice)
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to drycleaner_invoice_path(@invoice)
	end
	
	private

		def item_params
			params.require(:item).permit(:description, :quantity, :amount)
		end

		def find_invoice
			@invoice = Invoice.find(params[:invoice_id])
		end

		def find_item
			@item = @invoice.items.find(params[:id])
		end
	
end
