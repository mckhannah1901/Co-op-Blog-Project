class MicropostsController < ApplicationController

    # before_action :logged_in, only: [:create, :destroy]

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
            redirect_to current_user
        end
    end

    def destroy
    end

    private

        def micropost_params
            params.require(:micropost).permit(:title, :content)
        end
    end