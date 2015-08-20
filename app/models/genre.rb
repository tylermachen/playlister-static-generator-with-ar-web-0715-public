class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def to_slug
    self.name.downcase.split.join("-")
  end
end
