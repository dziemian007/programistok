# coding: utf-8

class TopicsController < ApplicationController
  # GET /topics
  # GET /topics.json

	before_filter :authenticate_admin!, :except => [:new, :create]

  def index
    @topics = Topic.paginate(:page => params[:page], :per_page => 20)
		@user = current_admin
		@title = "Tematy"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
		@meeting = Meeting.find(@topic.meeting_id) unless @topic.meeting_id.nil?
		@title = "Tematy | " + @topic.title
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new
		@title = "Nowy temat"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
		@title = "Edycja tematu"
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
		@title = "Nowy temat"
    respond_to do |format|
      if @topic.save
        UserMailer.send_email(@topic, topic_url(@topic)).deliver
				if admin_signed_in?
					format.html { redirect_to @topic, notice: 'Temat utworzono pomyślnie.' }
				else
	        format.html { redirect_to root_path, notice: 'Temat utworzono pomyślnie.' }
				end
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])
		@title = "Edycja tematu"
    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Temat zapisano pomyślnie.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
		@title = "Usuwanie tematu"
    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :ok }
    end
  end
end
