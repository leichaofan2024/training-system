class Admin::ScenesController < ApplicationController
  layout "admin"
  before_action :require_is_admin
  before_action :find_scene, only: [:show, :edit , :update, :destroy]

  def index
    @scenes = Scene.all
  end

  def show
    @switches = @scene.switches.order("id ASC")
    @lights = @scene.lights.order("id ASC")
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = Scene.new(scene_params)
    if @scene.save
      redirect_to admin_scenes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scene.update(scene_params)
      redirect_to scenes_path
    else
      render :edit
    end
  end

  def destroy
    @scene.destroy
    redirect_to admin_scenes_path, alert: "你已成功删除此场景"
  end

  private

  def scene_params
    params.require(:scene).permit(:title,:description)
  end

  def find_scene
    @scene = Scene.find(params[:id])
  end
end
