module PagesHelper

  def tags_separated_by_comma(post)
    post.tags.to_a.join(', ')
  end

  def commenter_id
    current_user.try(:id) || 0
  end

  def commenter_type
  	current_user.try(:id) ? "User" : "Guest"
  end
end