class Story < ActiveRecord::Base

  default_scope :order => 'stories.created_at DESC'

	attr_accessible :title, :content, :teaser, :slug

  validates :title, :presence => true, :length => { :in => 5..200 }
  validates :content, :presence => true, :length => { :minimum => 5 }
  validates :teaser, :presence => true, :length => { :minimum => 5 }

	def to_param
		"#{id}-#{title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
	end

end
