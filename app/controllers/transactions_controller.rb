class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    respond_to do |format|
      format.json { render json: { transactions: @transactions }, status: :ok }
      format.html
    end
  end

  def show
    respond_to do |format|
      begin
        @transaction = Transaction.find(params[:id])
        format.json { render json: { transaction: @transaction }, status: :ok }
        format.html {}
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def new
    @transaction = Transaction.new
  end

  def edit
    respond_to do |format|
      begin
        @transaction = Transaction.find(params[:id])
        format.json { render json: { transaction: @transaction }, status: :ok }
        format.html {}
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      begin
        if @transaction.save
          format.json { render json: { transaction: @transaction }, status: :ok }
          format.html { redirect_to @transaction }
        else
          format.json { render json: { error: @transaction.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def update
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      begin
        if @transaction.update(transaction_params)
          format.json { render json: { transaction: @transaction }, status: :ok }
          format.html { redirect_to @transaction }
        else
          format.json { render json: { error: @transaction.errors }, status: :unprocessable_entity }
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
        @transaction = Transaction.find(params[:id])
        if @transaction.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to lockers_path }
        else
          format.json { render json: { error: @transaction.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { comment: 'Customer ID invalid' } }
      end
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:account_type, :account_id)
  end
end
