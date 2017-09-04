class Torrent < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  belongs_to :status

  validates :name, presence: true
  validates :torrent_hash, presence: true
  validates :category_id, presence: true
  validates :sub_category_id, presence: true
  validates :status, presence: true

  default_scope -> { order created_at: :desc }

  def full_category_name
    "#{category.name} - #{sub_category.name}"
  end

  def download_link
    "#"
  end

  def magnet_link
    "#"
  end

  def size
    "1MB"
  end

  def seeders
    0
  end

  def leechers
    0
  end

  def downloads
    0
  end

end
