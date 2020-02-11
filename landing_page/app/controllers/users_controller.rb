class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #authorize! :list, @users
    #@microposts = @user.microposts.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
     
    @user = User.find(params[:id])
    authorize! :view, @user, :message => "Unable to view user"
    # @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = @user.microposts
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Blogging Engine! Your account has been created and you're now logged in!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :second_name, :email, :password, :password_confirmation)
    end
end
