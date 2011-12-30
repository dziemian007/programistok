# coding: utf-8

class MeetingsController < ApplicationController

	before_filter :authenticate_admin!

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.paginate(:page => params[:page], :per_page => 20)
		@title = "Spotkania"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])
		@topics = Topic.where(:meeting_id => @meeting.id)
		@title = "Spotkania | " + @meeting.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new
		@alltopics = Topic.where(:meeting_id => nil)
		@title = "Nowe spotkanie"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
    @unusedtopics = Topic.where(:meeting_id => nil)
    @thistopics = Topic.where(:meeting_id => @meeting.id)
    @alltopics = @thistopics + @unusedtopics
    @title = "Edycja spotkania"
  end

  # POST /meetings
  # POST /meetings.json
  def create
		@title = "Nowe spotkanie"
    @meeting = Meeting.new(params[:meeting])
		unless params[:meeting][:topics].nil?
			@temp = Topic.find(params[:meeting][:topics])
			@meeting.topics = @temp
		end
    respond_to do |format|
      if @meeting.save
				@temp.each do |topic|
					topic.proposal = false
					topic.save
				end
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
				@alltopics = Topic.where(:meeting_id => nil)
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])
		@title = "Edycja spotkania"
		unless params[:meeting][:topics].nil?
      @oldtopics = Topic.where(:meeting_id => @meeting.id)
      @oldtopics.each do |topic|
        topic.update_attributes({:meeting_id => nil})
      end
			@temp = Topic.find(params[:meeting][:topics])
			@meeting.topics = @temp
		end
    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :ok }
      else
        @unusedtopics = Topic.where(:meeting_id => nil)
        @thistopics = Topic.where(:meeting_id => @meeting.id)
        @alltopics = @thistopics + @unusedtopics
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
		@title = "Usuwanie spotkania"
    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :ok }
    end
  end
end
