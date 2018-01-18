class AccountsController < ApplicationController
  def index
    @accounts= Account.all
    respond_to do |format|
      format.json { render json: {accountss: @accounts}, status: :ok }
      format.html 
    end
  end
  def  show
    respond_to do |format|
      begin
        @account= Account.find(params[:id])
        format.json {render json: {account: @account}, status: :ok }
        format.html { }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end
  end
  def new
    @account= Account.new
  end
  def edit
    respond_to do |format|
      begin 
        @account= Account.find(params[:id])
        format.html { }
        format.json { render json: {account: @account}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      begin
        if @account.save
          format.json { render json: {account: @account}, status: :ok }
          format.html { redirect_to @account }
        else
          format.json { render json: {error: @account.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end  
    end
  end
  def update
    @account = Account.find(params[:id])
    respond_to do |format|
      begin
        if @account.update(account_params)
          format.json { render json: {account: @account}, status: :ok }
          format.html { redirect_to @account }
        else
          format.json { render json: {error: @account.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render 'edit' }
      end
    end 
  end
  def destroy
    respond_to do |format|
      begin
        @account = Account.find(params[:id])
        if @account.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to accounts_path }
        else
          format.json { render json: {error: @account.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {comment: "Customer ID invalid"}}
      end
    end  
  end
  private
    def account_params
      params.require(:account).permit(:account_no, :balance, :customer_id)
    end
end
