class MicropostsController < ApplicationController

    include SessionsHelper

    before_action :set_micropost, only: [:show, :edit, :update, :destroy]

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
         @micropost = Micropost.find(params[:id])
    end

    def destroy
        @micropost.destroy
        redirect_to microposts_url, success: 'Blog post was succesfully destroyed'
    end

    def index 
        @microposts = Micropost.order(created_at: :desc) 
    end

    def show 
        @micropost = Micropost.find(params[:id])
    end

    def update
        @micropost = Micropost.find(params[:id])
        if @micropost.update(micropost_params)
            redirect_to microposts_url, success: 'Congratulations, the blog post was successfully updated!'
        else
            render :edit       
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

        def set_micropost
            @micropost = Micropost.find(params[:id])
        end
    end
