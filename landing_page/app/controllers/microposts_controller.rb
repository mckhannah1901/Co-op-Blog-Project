class MicropostsController < ApplicationController

    # before_action :set_micropost, only [:show, :edit, :update, :destroy]

    include SessionsHelper

    def new
        @micropost = Micropost.new
    end
  
    def create
        @micropost = Micropost.new(micropost_params)
        
        if @micropost.save
            flash[:success] = "Blog post was successfully created!"
            redirect_to microposts_path
        else
            flash[:danger] = "Failed to create your blog post"
            render :new
        end
    end

    def edit
    end

    def destroy
    end

    def index 
        @microposts = Micropost.all 
    end

    def show 
        @micropost = Micropost.find(params[:id])
    end

    def update
        respond_to do |format|
            if @micropost.update(micropost_params)
                format.html { redirect_to @micropost, notice: 'Blog post was successfully updated.' }
                format.json { render :show, status: :ok, location: @micropost }
            else
                format.html { render :edit }
                format.json { render json: @micropost.errors, status: :unprocessable_entity }
            end
        end
    end
   

    def micropost_summary(micropost)
        ActionController::Base.helpers.strip_tags(micropost.content.to_s.truncate(300))
    end

    helper_method :micropost_summary

    private

        def micropost_params
            params[:micropost][:user_id] = current_user.id
            params.require(:micropost).permit(:title, :content, :user_id)
        end
    end