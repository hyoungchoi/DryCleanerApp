class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_invoice, except: [:index, :new, :create]

	def index
		@invoices = current_user.invoices.order("created_at DESC")
		#if current_user.type == "Drycleaner"
		#	@invoices = Invoice.where(drycleaner_email: current_user.email).order("created_at DESC")
		#else
		#	@invoices = Invoice.where(customer_email: current_user.email).order("created_at DESC")
		#end
	end

	def show
	end

	def new
		@invoice = current_user.invoices.build
	end

	def create
		@invoice = current_user.invoices.build(invoice_params)
		@invoice.customer_id = Customer.where(email: @invoice.customer_email).first.id
		if @invoice.save
			redirect_to drycleaner_invoices_path(current_user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @invoice.update(invoice_params)
			redirect_to drycleaner_invoice_path
		else
			render 'edit'
		end
	end

	def destroy
		@invoice.destroy
		redirect_to drycleaner_invoices_path(current_user)
	end

	private

		def invoice_params
			params.require(:invoice).permit(:name, :customer_email, :pickup)
		end

		def find_invoice
			@invoice = current_user.invoices.find(params[:id])
		end

end
