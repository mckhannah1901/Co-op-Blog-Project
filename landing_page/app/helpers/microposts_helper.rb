module MicropostsHelper

    def destroy
        micropost.delete[:micropost_id]
    end
end
