class SwitchesController < ApplicationController

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

end
