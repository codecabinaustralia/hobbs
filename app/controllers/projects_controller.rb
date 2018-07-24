class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @quote_message = QuoteMessage.new
    @item_groups = ItemGroup.all
    @project_item = ProjectItem.new
    @variation = Variation.new
    @variation_quote = Variation.new
    @post = Post.new
    @posts = Post.where(project_id: @project.id).order("created_at DESC").all
    @post_reply = PostReply.new
    @zones = Zone.where(project_id: @project.id)
    
    #Builder Quote Stage
    @project_items = ProjectItem.where(project_id: @project.id).all
    
  end

  def project_item
    @project_item = ProjectItem.new(
      project_id:params[:project_id] ,
      zone_id: params[:zone_id],
      zone_item_group_id: params[:zone_item_group_id],
      category_id: params[:category_id],
      item_group_id: params[:item_group_id],
      item_id: params[:item_id],
      item_attribute_id: params[:item_attribute_id]
    )

    @project = Project.find(params[:project_id])
    @my_user = ProjectUser.where(project_id: params[:project_id]).where(role: "owner").last
    @owner = User.find(@my_user.user_id)

    #SEND EMAIL
    UserMailer.items_added(@owner, @project).deliver

    @project_item.save!


    respond_to do |format|
      if @project_item.save
        if @project_item.item_attribute_id.present?
          @post = Post.new(
            content: "ITEM ADDED - #{@project_item.item.title} (#{@project_item.item_attribute.title}) for #{@project_item.item_group.title} in the #{@project_item.zone.title}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "ITEM ADDED - #{@project_item.item.title} for #{@project_item.item_group.title} in the #{@project_item.zone.title}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        end

        format.html { redirect_to project_path(params[:project_id]), notice: 'Item added was successfully created.' }
        format.json { render :show, status: :created, location: @project_item }
      else
        format.html { render :new }
        format.json { render json: @project_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def project_item_comment
    @project_item = ProjectItem.find(project_item_params[:item_id])
    @project_item.update_attributes(quote_note: project_item_params[:quote_note])
    redirect_to project_path(@project_item.project.id)
  end

  def project_item_close
    @project_item = ProjectItem.find(project_item_params[:item_id])
    @project_item.update_attributes(
                          quote_total: project_item_params[:quote_total],
                          discussion_raised: nil
                          )

    if @project_item.item_attribute_id.present?
          @post = Post.new(
            content: "QUOTE ADDED - #{@project_item.item.title} (#{@project_item.item_attribute.title}) for #{@project_item.item_group.title} in the #{@project_item.zone.title} - Additional Cost $#{@project_item.quote_total}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "QUOTE ADDED - #{@project_item.item.title} for #{@project_item.item_group.title} in the #{@project_item.zone.title} - Additional Cost $#{@project_item.quote_total}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        end

    redirect_to project_path(@project_item.project.id, :quote_stage => true)
  end

  def project_item_discuss
    @project_item = ProjectItem.find(project_item_params[:item_id])


    if @project_item.item_attribute_id.present?
          @post = Post.new(
            content: "RAISED DISCUSSION: #{@project_item.item.title} (#{@project_item.item_attribute.title})" + project_item_params[:quote_note],
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "RAISED DISCUSSION: #{@project_item.item.title} in #{@project_item.zone.title}: " + project_item_params[:quote_note],
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        end

    
    @project_item.update_attributes(discussion_raised: true)

    redirect_to project_path(@project_item.project_id)
  end


  def project_item_approve
    @project_item = ProjectItem.find(params[:project_item])

    @project_item.update_attributes(quote_approved: true)

    if @project_item.item_attribute_id.present?
          @post = Post.new(
            content: "QUOTE APPROVED - #{@project_item.item.title} (#{@project_item.item_attribute.title}) for #{@project_item.item_group.title} in the #{@project_item.zone.title} - Additional Cost $#{@project_item.quote_total}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "QUOTE APPROVED - #{@project_item.item.title} for #{@project_item.item_group.title} in the #{@project_item.zone.title} - Additional Cost $#{@project_item.quote_total}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        end

        @item = Item.find(@project_item.item_id)
        @project = Project.find(@project_item.project_id)
        @owner = ProjectUser.where(project_id: @project.id).where(role: "owner").last
        @owner = User.find(@owner.user_id)

        #SEND EMAIL
        UserMailer.items_approved(@project, @item, @owner).deliver

    redirect_to project_path(@project_item.project_id)
  end



  def delete_project_item
    @project_item = ProjectItem.find(params[:project_item])
    @project_item.destroy

    if @project_item.item_attribute_id.present?
          @post = Post.new(
            content: "ITEM DELETED - #{@project_item.item.title} (#{@project_item.item_attribute.title}) for #{@project_item.item_group.title} in the #{@project_item.zone.title}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        else
          @post = Post.new(
            content: "ITEM DELETED - #{@project_item.item.title} for #{@project_item.item_group.title} in the #{@project_item.zone.title}",
            user_id: current_user.id,
            project_id: @project_item.project_id
            )
          @post.save!
        end

    redirect_to project_path(params[:project_id])
  end

  def confirm_project
    @project = Project.find(params[:project_id])
    @project.update_attributes(confirmed: true)

    #@owner = ProjectUser.where(project_id: @project.id).where(role: "owner").last
    #@owner = User.find(@owner.user_id)
    #@client = ProjectUser.where(project_id: @project.id).where(role: [nil, false]).last
    #@client = User.find(@client.user_id)

    @post = Post.new(
      content: "#{(@project.title).upcase} - SIGNED OFF (STAGE 1)",
      user_id: current_user.id,
      project_id: @project.id
      )
    @post.save!

    #SEND EMAIL
    #UserMailer.sign_off_items(@project, @client, @owner).deliver

    redirect_to project_path(params[:project_id])

    #Send builder notifications of confirmed items

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.project_users.new(user_id: current_user.id, role: "owner")

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project, :quote_stage =>true), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:category_id, :client_id, :title, :address, :city, :state, :postcode, :base_price, zones_attributes: [:id, :title, :_destroy])
    end

    def project_item_params
      params.require(:project_item).permit(:project_id, :item_id, :item_group_id, :category_id, :quote_note, :quote_total, :zone_id, :zone_item_group_id, :project_attribute_id)
    end
end
