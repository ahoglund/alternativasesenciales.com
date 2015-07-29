module PagesHelper

  def tags_separated_by_comma(post)
    post.tags.to_a.join(', ')
  end
  
end