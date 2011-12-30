class Topic < ActiveRecord::Base

	attr_accessible :title, :content, :speaker, :email, :proposal, :meeting_id

	belongs_to :meeting

	after_create :init

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :title, :presence => true, :length => { :in => 5..200 }
  validates :speaker, :presence => true, :length => { :in => 5..200 }
  validates :email, :presence => true, :format => { :with => email_regex }

	def init
		self.proposal = true
	end

	def short_desc
		"#{self.speaker}: #{self.title[0..20]}".strip
	end

end
