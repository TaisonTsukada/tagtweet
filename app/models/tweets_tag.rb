class TweetsTag

  include ActiveModel::Model
  attr_accessor :message, :name, :content

  with_options presence: true do
    validates :message
    validates :name
    validates :content_required
  end

  def save
    tweet = Tweet.create(message: message,content: content)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

  def content_required
    errors.add(:content, "is required") unless content.body.present?
  end 
  

end