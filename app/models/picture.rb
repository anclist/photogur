class Picture < ApplicationRecord

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

validates :artist, :title, :image, presence: true
validates :title, length: { in: 3..50 }

  def self.newest_first
    Picture.order("created_at DESC")
  end

end
