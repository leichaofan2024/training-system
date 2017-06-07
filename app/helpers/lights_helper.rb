module LightsHelper

  def render_light_status(light)
    if light.is_on?
      content_tag(:i, "", class: "fa fa-circle fa-lg green-light")
    else
      content_tag(:i, "", class: "fa fa-circle fa-lg red-light")
    end
  end

end
