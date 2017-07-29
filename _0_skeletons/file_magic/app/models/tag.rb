class Tag < ApplicationRecord
  has_many :taggings
  has_many :entries, through: :taggings, source: :taggable, source_type: :Entry

  def self.parse_tags(tags)
    tags.split(',').map do |tag|
      Tag.find_or_create_by(name: tag.strip)
    end
  end
end
