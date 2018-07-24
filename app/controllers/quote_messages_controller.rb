class QuoteMessagesController < ApplicationController
  before_action :set_quote_message, only: [:show, :edit, :update, :destroy]

  # GET /quote_messages
  # GET /quote_messages.json
  def index
    @quote_messages = QuoteMessage.all
  end

  # GET /quote_messages/1
  # GET /quote_messages/1.json
  def show
  end

  # GET /quote_messages/new
  def new
    @quote_message = QuoteMessage.new
  end

  # GET /quote_messages/1/edit
  def edit
  end

  # POST /quote_messages
  # POST /quote_messages.json
  def create
    @quote_message = QuoteMessage.new(quote_message_params)
    @message = @quote_message
    respond_to do |format|
      if @quote_message.save

        @post = Post.new(
          content: "EMAIL - #{@quote_message.body}",
          user_id: @quote_message.user_id,
          project_id: @quote_message.project_id
          )
        @post.save!

        @project_users = ProjectUser.where(project_id: @quote_message.project_id).all.pluck(:user_id)
        @clients = User.where(id: @project_users)
        @clients.each do |client|
          #Send an email to each client
          @client = User.find(client.id)
          UserMailer.notify_clients(@client, @message).deliver
        end

        format.html { redirect_to project_path(@quote_message.project_id, :quote_stage => true), notice: 'Quote message was successfully created.' }
        format.json { render :show, status: :created, location: @quote_message }
      else
        format.html { render :new }
        format.json { render json: @quote_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_messages/1
  # PATCH/PUT /quote_messages/1.json
  def update
    respond_to do |format|
      if @quote_message.update(quote_message_params)
        format.html { redirect_to @quote_message, notice: 'Quote message was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_message }
      else
        format.html { render :edit }
        format.json { render json: @quote_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_messages/1
  # DELETE /quote_messages/1.json
  def destroy
    @quote_message.destroy
    respond_to do |format|
      format.html { redirect_to quote_messages_url, notice: 'Quote message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_message
      @quote_message = QuoteMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_message_params
      params.require(:quote_message).permit(:body, :project_id, :user_id)
    end
end
