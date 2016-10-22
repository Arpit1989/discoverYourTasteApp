class Music < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  has_and_belongs_to_many :users
  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
        :genre,
        [:genre, :artist],
        [:genre, :artist, :song_name],
    ]
  end

  def self.random_select
    Music.limit(1).order("RAND()");
  end

end
