module UsersHelper
  def followers_users_list(followers)
    users = []
    followers.each do |follower|
      users << follower.user
    end
    users
  end

  def followings_users_list(followers)
    users = []
    followers.each do |follower|
      users << User.find(follower.follow_id)
    end
    users
  end
end
