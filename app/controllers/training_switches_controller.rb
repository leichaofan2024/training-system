class TrainingSwitchesController < ApplicationController

  def training_light_toggle
    @scene = Scene.find(params[:scene_id])
    @training = @scene.trainings.where(scene_id: @scene.id, user_id: current_user.id).last
    @training_switch = @training.training_switches.find(params[:id])
    if @training_switch.is_on?
      @training_switch.update(:is_on => false)
    else
      @training_switch.update(:is_on => true)
    end
    @training_lights = @training_switch.training_lights
    @training_lights.each do |training_light|
      if training_light.is_on?
      training_light.update(:is_on => false)
      else
        training_light.update(:is_on => true)
      end
    end
    redirect_to :back
  end


end
