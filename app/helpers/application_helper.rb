module ApplicationHelper
  def app_name
    Rails.application.class.module_parent_name
  end
  def app_name
      'Wish List'
  end
end
