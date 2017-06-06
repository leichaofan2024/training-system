class SwitchesController < ApplicationController
   before_action :find_switch,only: [:edit,:update, :destroy]

  def create
    @scene = Scene.find(params[:scene_id])
    @switch= Switch.new(switch_params)
    @switch.scene = @scene
    if @switch.save
      redirect_to scene_path(@scene)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @switch.update(switch_params)
      redirect_to  scene_path(@scene)
    else
      render :edit
    end
  end

  def destroy
    @switch.destroy, alert: "你已成功删除#{@switch.title}按钮！"
    redirect_to scene_path(@scene)
  end

  private

  def switch_params
    params.require(:switch).permit(:title,:description,:scene_id)
  end

  def find_switch
    @scene = Scene.find(params[:scene_id])
    @switch = Switch.find(params[:id])
  end

end
