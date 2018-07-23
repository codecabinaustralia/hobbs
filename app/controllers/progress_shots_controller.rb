class ProgressShotsController < ApplicationController
  before_action :set_progress_shot, only: [:show, :edit, :update, :destroy]

  # GET /progress_shots
  # GET /progress_shots.json
  def index
    @progress_shots = ProgressShot.all
  end

  # GET /progress_shots/1
  # GET /progress_shots/1.json
  def show
  end

  # GET /progress_shots/new
  def new
    @progress_shot = ProgressShot.new
  end

  # GET /progress_shots/1/edit
  def edit
  end

  # POST /progress_shots
  # POST /progress_shots.json
  def create
    @progress_shot = ProgressShot.new(progress_shot_params)

    respond_to do |format|

      @post = Post.new(
        content: "PROGRESS SHOT - #{@progress_shot.title} - #{@progress_shot.description} - #{view_context.link_to 'View Photo', @progress_shot.image, style: 'color: #fff;'}",
        user_id: current_user.id,
        project_id: @progress_shot.project_id
        )
      @post.save!

      if @progress_shot.save
        format.html { redirect_to project_path(@progress_shot.project_id), notice: 'Progress shot was successfully created.' }
        format.json { render :show, status: :created, location: @progress_shot }
      else
        format.html { render :new }
        format.json { render json: @progress_shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_shots/1
  # PATCH/PUT /progress_shots/1.json
  def update
    respond_to do |format|
      if @progress_shot.update(progress_shot_params)
        format.html { redirect_to @progress_shot, notice: 'Progress shot was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress_shot }
      else
        format.html { render :edit }
        format.json { render json: @progress_shot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_shots/1
  # DELETE /progress_shots/1.json
  def destroy
    @progress_shot.destroy
    respond_to do |format|
      format.html { redirect_to progress_shots_url, notice: 'Progress shot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress_shot
      @progress_shot = ProgressShot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_shot_params
      params.require(:progress_shot).permit(:title, :description, :project_id, :image)
    end
end
