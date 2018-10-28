class PoliticiansController < ApplicationController
  before_action :set_politician, only: [:show, :edit, :update, :destroy]

  # GET /politicians
  # GET /politicians.json
  def index

    if params[:order].present?
      @politicians = Politician.all.order(:region).paginate(:page => params[:page], :per_page =>100)
    else 
      @politicians = Politician.joins(:politics).group(:id).order(:region).paginate(:page => params[:page], :per_page =>100)
    end
  end

  # GET /politicians/1
  # GET /politicians/1.json
  def show
  end

  # GET /politicians/new
  def new
    @politician = Politician.new
    @hashtags = Hashtag.all
  end

  # GET /politicians/1/edit
  def edit
    @hashtags = Hashtag.all
  end

  # POST /politicians
  # POST /politicians.json
  def create
    @politician = Politician.new(politician_params)

    respond_to do |format|
      if @politician.save
        format.html { redirect_to @politician, notice: 'Politician was successfully created.' }
        format.json { render :show, status: :created, location: @politician }
      else
        format.html { render :new }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /politicians/1
  # PATCH/PUT /politicians/1.json
  def update
    respond_to do |format|
      if @politician.update(politician_params)
        format.html { redirect_to @politician, notice: 'Politician was successfully updated.' }
        format.json { render :show, status: :ok, location: @politician }
      else
        format.html { render :edit }
        format.json { render json: @politician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /politicians/1
  # DELETE /politicians/1.json
  def destroy
    @politician.destroy
    respond_to do |format|
      format.html { redirect_to politicians_url, notice: 'Politician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def hashtags
    @hashtags = Hashtag.all
  end

  def add_hashtag
    name = params[:name]
    type_id = params[:type_id]
    hashtag = Hashtag.new(name: name, politic_type_id: type_id)
    hashtag.save!
  end

  def get_hashtags
    type = params[:type]
    @hashtags = Hashtag.where(:politic_type_id => type)

    render json: @hashtags
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_politician
      @politician = Politician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def politician_params
      params.require(:politician).permit(:name, :region, :party, :age, :gender, :city, :birth, :school, :experience)
    end
end
