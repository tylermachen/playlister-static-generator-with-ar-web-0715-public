module Slugifiable
  def to_slug
    name.downcase.split.join("-")
  end
end
