class MallsController < ApplicationController
  before_action :set_mall, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /malls
  # GET /malls.json
  def search
    if params[:search].present?
        @malls = Mall.search(params[:search])
    else
      @malls = Mall.all 
    end     
  end  

  def index
    @malls = Mall.all
  end

  # GET /malls/1
  # GET /malls/1.json
  def show
    @stores = Store.where(mall_id: @mall.id).order("created_at DESC")
  end

  # GET /malls/new
  def new
    @mall = current_user.malls.build
  end

  # GET /malls/1/edit
  def edit
  end

  # POST /malls
  # POST /malls.json
  def create
    @mall = current_user.malls.build(mall_params)

    respond_to do |format|
      if @mall.save
        format.html { redirect_to @mall, notice: 'Mall was successfully created.' }
        format.json { render :show, status: :created, location: @mall }
      else
        format.html { render :new }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /malls/1
  # PATCH/PUT /malls/1.json
  def update
    respond_to do |format|
      if @mall.update(mall_params)
        format.html { redirect_to @mall, notice: 'Mall was successfully updated.' }
        format.json { render :show, status: :ok, location: @mall }
      else
        format.html { render :edit }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /malls/1
  # DELETE /malls/1.json
  def destroy
    @mall.destroy
    respond_to do |format|
      format.html { redirect_to malls_url, notice: 'Mall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mall
      @mall = Mall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mall_params
      params.require(:mall).permit(:name, :open, :close, :address, :image)
    end
end
