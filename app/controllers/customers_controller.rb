class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    respond_to do |format|
      format.json { render json: { customers: @customers }, status: :ok }
      format.html
    end
  end

  def show
    respond_to do |format|
      begin
        @customer = Customer.find(params[:id])
        format.json { render json: { customer: @customer }, status: :ok }
        format.html {}
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def new
    @customer = Customer.new
  end

  def edit
    respond_to do |format|
      begin
        @customer = Customer.find(params[:id])
        format.html {}
        format.json { render json: { customer: @customer }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      begin
        if @customer.save
          format.json { render json: { customer: @customer }, status: :ok }
          format.html { redirect_to @customer }
        else
          format.json { render json: { error: @customer.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def update
    @customer = Customer.find(params[:id])
    respond_to do |format|
      begin
        if @customer.update(customer_params)
          format.json { render json: { customer: @customer }, status: :ok }
          format.html { redirect_to @customer }
        else
          format.json { render json: { error: @customer.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    respond_to do |format|
      begin
        @customer = Customer.find(params[:id])
        if @customer.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to customers_path }
        else
          format.json { render json: { error: @customer.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { comment: 'Customer ID invalid' } }
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :phone, :bank_id)
  end
end
