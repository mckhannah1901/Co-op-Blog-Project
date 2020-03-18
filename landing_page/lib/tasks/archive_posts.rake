desc "Archive posts periodically based on if they are one week old or more"

task archive: :environment do
    archiveable_posts = Micropost.order(created_at: :desc).kept.where("created_at <= ?", Time.now-7.days)

    archiveable_posts.each do |archiveable_post|
        archiveable_post.archived = true
        archiveable_post.save
    end
end
