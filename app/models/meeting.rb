class Meeting < ActiveRecord::Base

	attr_accessible :title, :content, :datetime, :place

	has_many :topics, :dependent => :destroy
	accepts_nested_attributes_for :topics, :allow_destroy => true
  validates :topics, :presence => true

  validates :title, :presence => true, :length => { :in => 5..200 }
  validates :content, :presence => true, :length => { :minimum => 5}
  validates :place, :presence => true, :length => { :minimum => 5}
	validates :datetime, :date => { :after => Time.now }

end
