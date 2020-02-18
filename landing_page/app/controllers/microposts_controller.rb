class MicropostsController < ApplicationController

    include SessionsHelper

    def new
        @micropost = Micropost.new
    end
  
    def create
        @micropost = Micropost.new(micropost_params)
        
        if @micropost.save
            flash[:success] = "Blog post was successfully created!"
            redirect_to current_user
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
        # @micropost = Micropost.all
    end

    

    private

        def micropost_params
            params[:micropost][:user_id] = current_user.id
            params.require(:micropost).permit(:title, :content, :user_id)
        end
    end