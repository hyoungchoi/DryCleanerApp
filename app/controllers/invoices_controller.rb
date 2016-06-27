class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invoice, except: [:index, :new, :create]

	def index
		if current_user.type == "Customer"
			@invoices = Invoice.where(customer_id: current_user).order("created_at DESC")
		else
			@invoices = Invoice.where(drycleaner_id: current_user).order("created_at DESC")
		end
	end

	def show
		@items = @invoice.items
	end

	def new
		@invoice = current_user.invoices.build
		@items = @invoice.items
	end

	def create
		@invoice = current_user.invoices.build(invoice_params)
		@invoice.drycleaner_email = current_user.email
		@invoice.customer_id = Customer.where(email: @invoice.customer_email).first.id
		if @invoice.save
			redirect_to invoices_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @invoice.update(invoice_params)
			redirect_to invoices_path
		else
			render 'edit'
		end
	end

	def destroy
		@invoice.destroy
		redirect_to invoices_path
	end

	private

		def invoice_params
			params.require(:invoice).permit(:name, :customer_email, :pickup)
		end

		def find_invoice
			@invoice = current_user.invoices.find(params[:id])
		end

end