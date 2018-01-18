class LockersController < ApplicationController
	def index
    @lockers= Locker.all
    respond_to do |format|
      format.json { render json: {lockers: @lockers}, status: :ok }
      format.html 
    end
  end
  def show
    respond_to do |format|
      begin
        @locker= Locker.find(params[:id])
        format.json {render json: {locker: @locker}, status: :ok }
        format.html { }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end
  end
  def new
    @locker= Locker.new
  end
  def edit
    respond_to do |format|
      begin 
        @locker= Locker.find(params[:id])
        format.html { }
        format.json { render json: {locker: @locker}, status: :ok }
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end 
  end
  def create
    @locker= Locker.new(locker_params)
    respond_to do |format|
      begin
        if @locker.save
          format.json { render json: {locker: @locker}, status: :ok }
          format.html { redirect_to @locker }
        else
          format.json { render json: {error: @locker.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {error: e.message} }
      end
    end
  end
  def update
    @locker = Locker.find(params[:id])
    respond_to do |format|
      begin 
        if @locker.update(locker_params)
          format.json { render json: {locker: @locker}, status: :ok }
          format.html { redirect_to @locker }
        else
          format.json { render json: {error: @locker.errors}, status: :unprocessable_entity }
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
        @locker= Locker.find(params[:id])
        if @locker.destroy
          format.json { render json: {}, status: :ok }
          format.html { redirect_to lockers_path }
        else
          format.json { render json: {error: @locker.errors}, status: :unprocessable_entity }
          format.html { render 'new' }
        end
      rescue => e
        format.json { render json: {error: e.message}, status: :unprocessable_entity }
        format.html { render html: {comment: "Customer ID invalid"}}
      end
    end
  end
  private
    def locker_params
      params.require(:locker).permit(:locker_key, :account_id)
    end
end
