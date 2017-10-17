class Picture < ApplicationRecord

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
    test = Picture.group("strftime('%Y', created_at)")
    # byebug
    test
  end


end
