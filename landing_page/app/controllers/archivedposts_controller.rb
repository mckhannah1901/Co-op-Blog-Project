class ArchivedpostsController < ApplicationController
  before_action :set_archivedpost, only: [:show, :edit, :update, :destroy]

  # GET /archivedposts
  # GET /archivedposts.json
  def index
    # @microposts = Micropost.kept.order(created_at: :desc) 
    # @microposts_archiveable = @microposts.where { |t| t.created_at > (Time.now-7.days)}
    @microposts_archiveable  = Micropost.kept.where("created_at < ?", Time.now-7.days).order(created_at: :desc)
  end

  # GET /archivedposts/1
  # GET /archivedposts/1.json
  def show
  end

  def micropost_summary(micropost)
    ActionController::Base.helpers.strip_tags(micropost.content.to_s.truncate(300))
  end

  helper_method :micropost_summary

  # GET /archivedposts/new
  # def new
  #   @archivedpost = Archivedpost.new
  # end

  # GET /archivedposts/1/edit
  # def edit
  # end

  # # POST /archivedposts
  # # POST /archivedposts.json
  # def create
  #   @archivedpost = Archivedpost.new(archivedpost_params)

  #   respond_to do |format|
  #     if @archivedpost.save
  #       format.html { redirect_to @archivedpost, notice: 'Archivedpost was successfully created.' }
  #       format.json { render :show, status: :created, location: @archivedpost }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @archivedpost.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /archivedposts/1
  # # PATCH/PUT /archivedposts/1.json
  # def update
  #   respond_to do |format|
  #     if @archivedpost.update(archivedpost_params)
  #       format.html { redirect_to @archivedpost, notice: 'Archivedpost was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @archivedpost }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @archivedpost.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /archivedposts/1
  # # DELETE /archivedposts/1.json
  # def destroy
  #   @archivedpost.destroy
  #   respond_to do |format|
  #     format.html { redirect_to archivedposts_url, notice: 'Archivedpost was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivedpost
      @archivedpost = Archivedpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def archivedpost_params
      params.require(:archivedpost).permit(:title, :content, :user_id)
    end
end
