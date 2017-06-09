class TrainingSwitchesController < ApplicationController

  def training_light_toggle
    @training_switch = TrainingSwitch.find(params[:id])
    @training_switch.update_training_switch_status!
    @training_lights = @training_switch.training_lights
    @training_lights.each do |training_light|
      training_light.update_training_light_status!
    end
    redirect_to :back
  end


end
