module FormHelper
  def horizontal_left_condensed_simple_form_for(resource, options, &block)
    options[:html] ||= {}
    options[:html][:class] ||= "" # trying to preserve already set classes
    options[:html][:class] << " form-horizontal form-condensed form-horizontal-left"
    options[:wrapper] = :horizontal_form_57
    options[:wrapper_mappings] = {
      check_boxes: :horizontal_radio_and_checkboxes_57,
      radio_buttons: :horizontal_radio_and_checkboxes_57
    }

    simple_form_for(resource, options, &block)
  end
end
