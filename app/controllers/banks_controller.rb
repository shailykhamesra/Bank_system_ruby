class BanksController < ApplicationController
  def index
    @banks = Bank.all
    respond_to do |format|
      format.json { render json: { banks: @banks }, status: :ok }
      format.html
    end
  end

  def show
    respond_to do |format|
      begin
        @bank = Bank.find(params[:id])
        format.json { render json: { bank: @bank }, status: :ok }
        format.html {}
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def new
    @bank = Bank.new
  end

  def edit
    respond_to do |format|
      begin
        @bank = Bank.find(params[:id])
        format.html {}
        format.json { render json: { bank: @bank }, status: :ok }
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def create
    @bank = Bank.new(bank_params)
    respond_to do |format|
      begin
        if @bank.save
          format.json { render json: { bank: @bank }, status: :ok }
          format.html { redirect_to @bank }
        else
          format.json { render json: { error: @bank.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { error: e.message } }
      end
    end
  end

  def update
    @bank = Bank.find(params[:id])
    respond_to do |format|
      begin
        if @bank.update(bank_params)
          format.json { render json: { bank: @bank }, status: :ok }
          format.html { redirect_to @bank }
        else
          format.json { render json: { error: @bank.errors }, status: :unprocessable_entity }
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
        @bank = Bank.find(params[:id])
        if @bank.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to @bank }
        else
          format.json { render json: { error: @bank.errors }, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: { error: e.message }, status: :unprocessable_entity }
        format.html { render html: { coment: 'bank ID invalid' } }
      end
    end
  end

  private

  def bank_params
    params.require(:bank).permit(:name, :address, :phone)
  end
end
