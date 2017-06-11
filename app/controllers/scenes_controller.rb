class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @switches = @scene.switches.order("id ASC")
    @lights = @scene.lights.order("id ASC")
    @training = Training.all.order("id ASC").where(scene_id: @scene.id, user_id: current_user.id).last
    if @training.present?
      @training_lights = @training.training_lights.order("id ASC")
      @training_switches = @training.training_switches.order("id ASC")
    else

      @training = Training.create(scene_id: @scene.id, user_id: current_user.id)

      @lights.each do |light|
        training_light = @training.training_lights.build(light_id: light.id, training_id: @training.id, is_on: light.is_on)
        training_light.save
      end
      @training_lights = @training.training_lights.order("id ASC")


      @switches.each do |switch|
        training_switch = @training.training_switches.build(switch_id: switch.id,training_id: @training.id,is_on: switch.is_on)

        if switch.lights.present?
          switch.lights.each do |light|
            training_switch.training_lights << @training_lights.all.find_by(light_id: light.id)
          end
        end

        training_switch.save
      end
      @training_switches = @training.training_switches.order("id ASC")
    end
  end

  def destroy_training
    @scene = Scene.find(params[:id])
    @training = @scene.trainings.find_by(user_id: current_user.id)
    @training.destroy
    redirect_to scene_path(@scene)
  end
  def operation_manual
    @scene = Scene.find(params[:id])
  end  
end
