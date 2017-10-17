class Picture < ApplicationRecord

validates :artist, :title, :url, presence: true
validates :title, length: { in: 3..20 }
validates :url, uniqueness: true
validates :url, format: URI::regexp(%w(http https))


  def self.newest_first
    Picture.order("created_at DESC")
  end

  def self.most_recent_five
    Picture.newest_first.limit(5)
  end

  def self.created_before
    last_month = Time.current - 1.month
    Picture.where("created_at < ?", last_month)
  end

  def self.pictures_created_in_year
    Picture.uniq.pluck("strftime('%Y', created_at)")
    # Picture.group("strftime('%Y', created_at)")
    # Picture.group("year(created_at)")
    # byebug
    # Picture.where("created_at >= ?", "#{year}-01-01 01:01:01").where("created_at <= ?", "#{year}-12-31 23:59:59")

  end


end
