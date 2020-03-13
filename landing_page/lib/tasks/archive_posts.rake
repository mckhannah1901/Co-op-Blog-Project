desc "Archive posts periodically based on if they are one week old or more"

task archive: :environment do
    archived_posts = Micropost.order(created_at: :desc).kept.where(created_at <= Time.now-7.days)

    archived_posts.each do |archived_post|
        archived_post.archived = true
        archived_post.save
    end
end
