class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id, message: "should not have copies of title for given artist" }, presence: true
  validates :artist_id, presence: true
  validates :image_url, presence: true

  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User



end
