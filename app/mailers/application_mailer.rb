class ApplicationMailer < ActionMailer::Base
  add_template_helper EmailTemplateHelper
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  default from: 'from@example.com'
  layout 'email'
end
