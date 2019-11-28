module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + "|" + base_title
    end
  end

  def error_messages_for(object)
		render(:partial => 'application/error_messages',
			:locals => {:object => object})
	end

  def ordinalize(number)
    number.ordinalize
  end

  # return the current user if any
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end


  # Returns the method name of the request if any
  def requesting_method
    params['action']
  end


  def extract_error_messages_into_array(query_result)
    messages = []
    query_result.each do |result|
      unless result.errors.empty?
        messages += result.errors.full_messages
      end
    end
    messages
  end

  def set_flash_with_error_messages(errors)
    flash[:warning] = ActionController::Base.helpers.pluralize(errors.count, 'record') + " didn't get saved. <br />"
    flash[:warning] << errors.uniq.join('<br />')
  end

  def prepare_messages_for_flash(query_result)
    non_saved_count = count_faulty_objects(query_result)
    messages = extract_error_messages_into_array(query_result)

    saved_count = query_result.count - non_saved_count

    create_success_flash_message(saved_count) if saved_count > 0
    create_error_flash_message(non_saved_count, messages) unless non_saved_count.zero?
    messages
  end

  def count_faulty_objects(query_result)
    count = 0
    query_result.each { |record| count += 1 if !record.errors.empty? }
    count
  end

  def create_success_flash_message(saved_count)
    flash[:success] = view_context.pluralize(saved_count, 'record') + " saved successfully "
  end

  def create_error_flash_message(count, messages)
    flash[:warning] = view_context.pluralize(count, 'record') + " did't get saved."
  end
end
