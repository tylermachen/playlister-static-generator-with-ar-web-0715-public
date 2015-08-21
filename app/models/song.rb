class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def to_slug
    name.downcase.split.join("-")
  end
end
