class Admin::LightsController < ApplicationController
    layout "admin"
    before_action :require_is_admin
    before_action :find_light,only: [:edit,:update, :destroy]
     def new
       @scene = Scene.find(params[:scene_id])
       @light = Light.new
     end
     def create
       @scene = Scene.find(params[:scene_id])
       @light= Light.new(light_params)
       @light.scene = @scene
       if @light.save
         redirect_to admin_scene_path(@scene)
       else
         render :new
       end
     end

     def edit
     end

     def update
       if @light.update(light_params)
         redirect_to  admin_scene_path(@scene)
       else
         render :edit
       end
     end

     def destroy
       @light.destroy
       redirect_to admin_scene_path(@scene)
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
