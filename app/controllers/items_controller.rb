class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.where(user_uploaded: [false, nil]).all
    @user_items = Item.where(user_uploaded: true).all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  def add_image
    @item = Item.find(params[:item_id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save

        @item_attribute = ItemAttribute.where(item_id: @item.id).last
        @item_attribute.attach(params[:image])
        
        if @item.user_uploaded.present?
          @item_project = ProjectItem.new(
              project_id: @item.project_id,
              item_id: @item.id,
              item_group_id: @item.item_group_id,
              category_id: @item.category_id,
              zone_id: @item.zone_id,
              zone_item_group_id: @item.zone_item_group_id
            )
          @item_project.save!           
        end

        format.html { redirect_to tips_path, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_user_item
    @item = Item.find(params[:item_id])
    @item.update_attributes(
      user_uploaded: nil
      )
    redirect_to items_path
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :description, :brand, :category_id, :item_group_id, :cost, :unit_label, :item_code, :user_id, :user_uploaded, :user_item_location, :user_item_storename, :project_id, :zone_id,:zone_item_group_id, :supplier_id, files:[], item_attributes_attributes: [:id, :item_code, :title, :_destroy, :image])
  
    end
end
