class Tweet < ApplicationRecord
  has_rich_text :content
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
end
