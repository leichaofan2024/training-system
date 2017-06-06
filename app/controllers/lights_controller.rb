class LightsController < ApplicationController

  before_action :find_light,only: [:edit,:update, :destroy]

 def create
   @scene = Scene.find(params[:scene_id])
   @light= Light.new(switch_params)
   @light.scene = @scene
   if @light.save
     redirect_to scene_path(@scene)
   else
     render :new
   end
 end

 def edit
 end

 def update
   if @light.update(light_params)
     redirect_to  scene_path(@scene)
   else
     render :edit
   end
 end

 def destroy
   @light.destroy, alert: "你已成功删除#{@light.title}按钮！"
   redirect_to scene_path(@scene)
 end

 private

 def light_params
   params.require(:light).permit(:title,:description,:scene_id, :switch_ids => [])
 end

 def find_light
   @scene = Scene.find(params[:scene_id])
   @light = Light.find(params[:id])
 end

end
