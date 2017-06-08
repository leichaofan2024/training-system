module SwitchesHelper

  def render_training_switch_status(training_switch)
    if training_switch.is_on?
      content_tag(:i, "", class: "fa fa-toggle-on fa-lg")
    else
      content_tag(:i, "", class: "fa fa-toggle-off fa-lg")
    end
  end



end
