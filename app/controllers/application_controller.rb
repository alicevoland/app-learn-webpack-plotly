class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :set_locale

  private

  def set_locale
    I18n.locale = if !params[:locale]
                    http_accept_language.compatible_language_from(I18n.available_locales)
                  else
                    params[:locale]
                  end
  end

  def layout_by_resource
    if devise_controller?
      'layouts/devise'
    else
      'layouts/application'
    end
  end
end
