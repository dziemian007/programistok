require 'rubygems'
require 'twitter'
require 'net/http'
require 'uri'


module ApplicationHelper

  def title
    base_title = "Programistok"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def to_slug(slug)
    #strip the string
    ret = slug.strip
    #blow away apostrophes
    ret.gsub! /['`]/,""
    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "
    #replace all non alphanumeric, underscore or periods with underscore
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '_'  
    #convert double underscores to single
    ret.gsub! /_+/,"_"
    #strip off leading/trailing underscore
    ret.gsub! /\A[_\.]+|[_\.]+\z/,""
    ret
  end

	def render_header(h2_text)
		ret = "<h1>" + image_tag("code.png", :style=>"margin-bottom:-20px;") + "Programistok <small>" + h2_text + "</small></h1>"
		link_to(raw(ret), root_path)
	end

	def conditional_error_message_for(model, field)
		unless model.errors[field][0].nil?
			raw("<div class='field_with_errors'><span>" + model.errors[field][0] + "</span></div>")
		end
	end








end
