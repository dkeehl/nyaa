module ApplicationHelper

  def category_icon torrent
    img = "#{torrent.category_id}_#{torrent.sub_category_id}.png"
    image_tag img, alt: torrent.full_category_name
  end

end
