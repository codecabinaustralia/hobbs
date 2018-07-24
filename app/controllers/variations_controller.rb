class VariationsController < ApplicationController
  before_action :set_variation, only: [:show, :edit, :update, :destroy]

  # GET /variations
  # GET /variations.json
  def index
    @variations = Variation.all
  end

  # GET /variations/1
  # GET /variations/1.json
  def show
  end

  # GET /variations/new
  def new
    @variation = Variation.new
  end

  # GET /variations/1/edit
  def edit
  end

  def variation_quote
    @variation = Variation.find(params[:variation_id])
    @variation.update_attributes(price: variation_quote_params[:price])

    if @variation.project_item.item_attribute_id.present?
          @post = Post.new(
            content: "VARIATION QUOTED - #{@variation.project_item.item.title} (#{@variation.project_item.item_attribute.title}) for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title} - Additional Cost $#{@variation.price}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!

        else
          @post = Post.new(
            content: "VARIATION QUOTED - #{@variation.project_item.item.title} for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title} - Additional Cost $#{@variation.price}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        end
    @project = Project.find(@variation.project_id)

    #@owner = ProjectUser.where(project_id: @project.id).where(role: "owner").last
    #puts @owner.id
    #@owner = User.find(@owner.user_id)
    #@client = ProjectUser.where(project_id: @project.id).where(role: [nil, false]).last
    #@client = User.find(@client.user_id)

    #SEND EMAIL
    #UserMailer.variation_request(@owner, @variation, @client, @project).deliver

    redirect_to project_path(@variation.project_id, :quote_stage => true)
  end

  def variation_approve
    @variation = Variation.find(params[:variation_id])
    @variation.update_attributes(approved: true)

    if @variation.project_item.item_attribute_id.present?
          @post = Post.new(
            content: "VARIATION APPROVED - #{@variation.project_item.item.title} (#{@variation.project_item.item_attribute.title}) for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title} - Additional Cost $#{@variation.price}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "VARIATION APPROVED - #{@variation.project_item.item.title} for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title} - Additional Cost $#{@variation.price}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        end

    @project_item = ProjectItem.find(@variation.project_item_id)
        @project_item.update_attributes(variation_requested: true)

    redirect_to project_path(@variation.project_id)
  end

  # POST /variations
  # POST /variations.json
  def create
    @variation = Variation.new(variation_params)

    if @variation.project_item.item_attribute_id.present?
          @post = Post.new(
            content: "VARIATION ADDED - #{@variation.project_item.item.title} (#{@variation.project_item.item_attribute.title}) for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "VARIATION ADDED - #{@variation.project_item.item.title} for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        end

    respond_to do |format|
      if @variation.save

        

        format.html { redirect_to project_path(@variation.project_id), notice: 'Variation was successfully created.' }
        format.json { render :show, status: :created, location: @variation }
      else
        format.html { render :new }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variations/1
  # PATCH/PUT /variations/1.json
  def update
    respond_to do |format|
      if @variation.update(variation_params)
        format.html { redirect_to @variation, notice: 'Variation was successfully updated.' }
        format.json { render :show, status: :ok, location: @variation }
      else
        format.html { render :edit }
        format.json { render json: @variation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variations/1
  # DELETE /variations/1.json
  def destroy
    @variation.destroy

    if @variation.project_item.item_attribute_id.present?
          @post = Post.new(
            content: "VARIATION DELETED - #{@variation.project_item.item.title} (#{@variation.project_item.item_attribute.title}) for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "VARIATION DELETED - #{@variation.project_item.item.title} for #{@variation.project_item.item_group.title} in the #{@variation.project_item.zone.title}",
            user_id: current_user.id,
            project_id: @variation.project_item.project_id
            )
          @post.save!
        end

        @project_item = ProjectItem.find(@variation.project_item_id)
        @project_item.update_attributes(variation_requested: false)

    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variation
      @variation = Variation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def variation_params
      params.require(:variation).permit(:project_item_id, :approved, :project_id, :item_id, :item_attribute_id)
    end

    def variation_quote_params
      params.require(:variation).permit(:price)
    end
end
