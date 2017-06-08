class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @switches = @scene.switches
    @lights = @scene.lights
    @training = Training.all.where(:scene_id => @scene.id)
                         .order("id DESC")
                         .first_or_create(scene_id: @scene.id, user_id: current_user.id)
    @lights.each do |light|
      training_light = @training.training_lights.new
      training_light.training = @training
      training_light.light = light
      training_light.is_on = light.is_on
      training_light.save
    end
    @training_lights = @training.training_lights


    @switches.each do |switch|
      training_switch = @training.training_switches.build(switch_id: switch.id,training_id: @training.id,is_on: switch.is_on)
      if switch.lights.present?
        switch.lights.each do |light|
          training_switch.training_lights << @training_lights.all.find_by(light_id: light.id)
        end
      end
    end
    @training_switches = @training.training_switches
  end


end
