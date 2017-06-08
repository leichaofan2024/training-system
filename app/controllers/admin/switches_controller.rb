class Admin::SwitchesController < ApplicationController
  layout "admin"
  before_action :require_is_admin
  before_action :find_switch,only: [:edit,:update, :destroy]
 def new
   @scene = Scene.find(params[:scene_id])
   @switch = Switch.new
 end

 def create
   @scene = Scene.find(params[:scene_id])
   @switch= Switch.new(switch_params)
   @switch.scene = @scene
   if @switch.save
     redirect_to admin_scene_path(@scene)
     @trainings = @scene.trainings
     @trainings.delete_all
   else
     render :new
   end
 end

 def edit
 end

 def update
   if @switch.update(switch_params)
     redirect_to  admin_scene_path(@scene)
     @trainings = @scene.trainings
     @trainings.delete_all
   else
     render :edit
   end
 end

 def destroy
   @switch.destroy
   redirect_to admin_scene_path(@scene)
   @trainings = @scene.trainings
   @trainings.delete_all
 end

 def light_toggle
   @scene = Scene.find(params[:scene_id])
   @switch = Switch.find(params[:id])
   if @switch.is_on?
     @switch.update(:is_on => false)
   else
     @switch.update(:is_on => true)
   end
   @lights = @switch.lights
   @lights.each do |light|
     if light.is_on?
     light.update(:is_on => false)
     else
       light.update(:is_on => true)
     end
   end
   redirect_to :back
 end

 private

 def switch_params
   params.require(:switch).permit(:title,:description,:scene_id, :is_on)
 end

 def find_switch
   @scene = Scene.find(params[:scene_id])
   @switch = Switch.find(params[:id])
 end

end
