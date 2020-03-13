desc "Archive posts periodically based on if they are one week old or more"

task archive: :environment do 
    # comparison = params[:archived] == "true" ? "<=" : ">"
    # query = "created_at #{comparison} ?"
    # @microposts_archived = Micropost.order(created_at: :desc).kept.where(query, Time.now-7.days)
    @microposts_archived = Micropost.order(created_at: :desc).kept.where(created_at <= Time.now-7.days)
end