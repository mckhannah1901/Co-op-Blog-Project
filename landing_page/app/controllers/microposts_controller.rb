class MicropostsController < ApplicationController

    before_action :set_micropost, only: [:show, :edit, :update, :destroy, :recover]

    include SessionsHelper
    require 'rake'

    load './lib/tasks/archive_posts.rake'

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
        @micropost.discard
        flash[:warning] = "Blog post deleted. Would you like to recover it? This option is only available until you leave/refresh the page. #{view_context.link_to('Undo', recover_micropost_path(@micropost))}".html_safe
        redirect_to microposts_url
    end

    def recover
        @micropost.undiscard
        redirect_to microposts_url, success: 'Blog post was recovered and restored'
    end

    helper_method :recover

    def index 
        archived = params[:archived] == "true" ? "true" : "false"
        archive = "archived = #{archived} ?"
        @microposts = Micropost.kept.where("archived = ?", archived).order(created_at: :desc)
        # @microposts = Micropost.kept.where("archived = ?", archived).order(created_at: :desc)
        # @microposts = Micropost.kept.where("archived = true").order(created_at: :desc)
        # archived = params[:archived] == "true" ? "true" : "false"
        # @microposts = Micropost.kept.where("archived = ?", archived).order(created_at: :desc)

        # Book.where("LENGTH(title) > ?", params[:min_length])


        # if params[:archived] == "true"
        #     @microposts = Micropost.kept.where(archived: true).order(created_at: :desc)
        # else
        #     @microposts = Micropost.kept.where(archived: false).order(created_at: :desc)
        # end
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
