class TrainingSwitchesController < ApplicationController

  def training_light_toggle
    @training_switch = TrainingSwitch.find(params[:id])
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
