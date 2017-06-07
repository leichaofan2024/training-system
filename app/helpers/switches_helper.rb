module SwitchesHelper

  def render_switch_status(switch)
    if switch.is_on?
      content_tag(:i, "", class: "fa fa-toggle-on fa-lg")
    else
      content_tag(:i, "", class: "fa fa-toggle-off fa-lg")
    end
  end

end
