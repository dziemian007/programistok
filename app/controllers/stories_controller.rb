# coding: utf-8

require 'rubygems'
require 'twitter'
require 'net/http'
require 'uri'

class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json

	before_filter :authenticate_admin!, :except => [:show, :uindex]

  def index
		@title = "Newsy"
    @stories = Story.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  def uindex
		@title = "Newsy"
    @stories = Story.paginate(:page => params[:page], :per_page => 20)

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @stories }
    #end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
		@title = "Newsy | " + @story.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new
		@title = "Nowy news"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
		@title = "Edycja newsa"
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])
		@title = "Nowy news"
    respond_to do |format|
      if @story.save
        Twitter.configure do |config|
          config.consumer_key = "d0cBwm8xz8xaDcl6UmQQ"
          config.consumer_secret = "slMtX83BBkncJ2PilzYjvEhYdtqVYggzZhVXGT8Ac"
          config.oauth_token = "450629388-dHkETGzc2AxWiQWABCGTlIPH8zxpszPFlBAI1CZq"
          config.oauth_token_secret = "IXBsgYXtra05zzbU8S7Bm8OniMZN17K1s9MIsoX2w"
        end
        Twitter.update(@story.title + "   " + story_url(@story))
        format.html { redirect_to @story, notice: 'Wiadomość utworzono pomyślnie.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])
		@title = "Edycja newsa"

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Wiadomość zapisano pomyślnie.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy
		@title = "Usuwanie newsa"

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end
end
