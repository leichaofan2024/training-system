class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find(params[:id])
    @switches = @scene.switches
    @lights = @scene.lights
  end

end
