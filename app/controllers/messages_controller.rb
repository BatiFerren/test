class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    #@messages = Message.all
    @messages = Message.all.order(:date_message).reverse_order
    @message = Message.new
##    @messages.each do |message|
#	@new_comment = Comment.build_from(message, current_user.id, "")
#	@comment = Comment.build_from(message, current_user.id, "")
#    end
    #commentable = commentable_type.constantize.find(commentable_id)
    #@comment = Comment.build_from(commentable, current_user.id, body)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])
    if user_signed_in?
        @new_comment = Comment.build_from(@message, current_user.id, "")
    end
    #@user_who_commented = current_chef
    #@comment = Comment.build_from( @message, @user_who_commented.id, "" )
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    @message = Message.new(message_params)

    time = Time.new
    @message.date_message = time.strftime("%Y-%m-%d %H:%M:%S")

    respond_to do |format|
      if @message.save
        #format.html { redirect_to @message, notice: 'Message was successfully created.' }
        #format.json { render :show, status: :created, location: @message }
        format.html { redirect_to '/messages', notice: 'Message was successfully created.' }
        format.json { render :index, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:date_message, :text_message)
    end
    
#    def comment_params
#	params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
#    end
#    
#    def commentable_type
#	comment_params[:commentable_type]
#    end
#    
#    def commentable_id
#	comment_params[:commentable_id]
#    end
#    
#    def comment_id
#	comment_params[:comment_id]
#    end
#    
#    def body
#	comment_params[:body]
#    end
#    
end
