module LightsHelper

  def render_training_light_status(training_light)
    if training_light.is_on?
      content_tag(:i, "", class: "fa fa-circle fa-lg green-light")
    else
      content_tag(:i, "", class: "fa fa-circle fa-lg red-light")
    end
  end

end
