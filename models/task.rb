##
# Task model
#
class Task
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :content, type: String
  field :hashtags, type: Array, default: []

  validates_presence_of :content, :user_id
  validates_length_of :content, maximum: 255

  belongs_to :user

  after_create :assign_hashtags

  def assign_hashtags
    get_tags(content)
    save
  end

  private

  def get_tags(content)
    content.scan(/#\w+/).map { |tag| hashtags.push(tag) }
  end
end
