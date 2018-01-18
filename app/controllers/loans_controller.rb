class LoansController < ApplicationController
	 def index
    @loans= Loan.all
    respond_to do |format|
      format.json { render json: {loans: @loans}, status: :ok }
      format.html 
    end
  end
  def show
    respond_to do |format|
      begin
        @loan= Loan.find(params[:id])
        format.json {render json: {loan: @loan}, status: :ok }
        format.html { }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end
  end
  def new
    @loan= Loan.new
  end
  def edit
    respond_to do |format|
      begin 
        @loan= Loan.find(params[:id])
        format.html { }
        format.json { render json: {loan: @loan}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }

      end
    end 
  end
  def create
    @loan= Loan.new(loan_params)
    respond_to do |format|
      begin
        if @loan.save
          format.json { render json: {loan: @loan}, status: :ok }
          format.html { redirect_to @loan }
        else
          format.json { render json: {error: @loan.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error:e.message}, status: :unprocessable_entity }
        format.html { render 'new' }
      end
    end
  end
  def update
    @loan = Loan.find(params[:id])
    respond_to do |format|
      begin 
        if @loan.update(loan_params)
          format.json { render json: {loan: @loan}, status: :ok }
          format.html { redirect_to @loan }
        else
          format.json { render json: {error: @loan.errors}, status: :unprocessable_entity }
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
        @loan= Loan.find(params[:id])
        if @loan.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to loans_path }
        else
          format.json { render json: {error: @loan.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {comment: "Customer ID invalid"}}
      end
    end
  end
  private
    def loan_params
      params.require(:loan).permit(:loan_type, :account_id)
    end
end
