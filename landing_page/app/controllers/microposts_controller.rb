class MicropostsController < ApplicationController

    # before_action :logged_in, only: [:create, :destroy]

    def new
    end
  
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            flash[:success] = "Blog post was successfully created!"
            redirect_to user
        else
            flash[:warning] = "Failed to create a blog post"
            redirect_to user
    end

    def destroy
    end

    private

        def micropost_params
            params.require(:micropost).permit(:title, :content)
        end
    end

end