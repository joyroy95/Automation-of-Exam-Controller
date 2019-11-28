module ButtonHelper
  def show_button(resource, options = {})
    size = get_size_or_xs(options)
    link_to fa_icon('info', text: 'Details'), resource,
      {class: "btn btn-default btn-#{size} "}.merge!(options) { |key, old, new| old + new } # merge to class if more specificed
  end

  def edit_button(resource, options = {})
    size = get_size_or_xs(options)
    link_to fa_icon('pencil', text: 'Edit'), edit_polymorphic_path(resource),
      {class: "btn btn-primary btn-#{size} "}.merge!(options) { |key, old, new| old + new } # merge to class if more specificed
  end
  def add_button(resource, options = {})
    size = get_size_or_xs(options)
    link_to fa_icon('pencil', text: 'ADD'), new_user_personal_info_path(user_id: resource),
      {class: "btn btn-primary btn-#{size} "}.merge!(options) { |key, old, new| old + new } # merge to class if more specificed
  end

  def delete_button(resource, options = {})
    size = get_size_or_xs(options)
    link_to fa_icon('trash-o', text: 'Delete'), resource, method: :delete, data: {confirm: 'Are you sure?'}.deep_merge!(options), class: "btn btn-danger btn-#{size} "
  end

  def get_size_or_xs(option_hash)
    # if size is specified, use that. Otherwise use xs
    option_hash[:size].present? ? option_hash.delete(:size) : "xs"
  end
end
