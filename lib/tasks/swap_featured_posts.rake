namespace :posts do
  desc 'swap featured posts'
  task swap_featured: :environment do
    Post.swap_featured
  end
end
