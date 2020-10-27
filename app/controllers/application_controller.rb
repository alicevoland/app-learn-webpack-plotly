class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    if !params[:locale]
      I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    else
      I18n.locale = params[:locale]
    end
  end
end