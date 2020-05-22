class ApplicationController < ActionController::Base
  before_action :set_locale # for localization

  def index
    @Segments = Segment.all
  end

#Localization:
  private
  #def set_locale
#    I18n.locale = extract_locale || I18n.default_locale
#  end
#  def extract_locale
#    parsed_locale = params[:locale]
#    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
#  end

    def set_locale
      locale = params[:locale].to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ?
      locale :
      I18n.default_locale
    end

  #The following  is going to include the locale parameter into every link generated with Rails helpers.
    def default_url_options
      { locale: I18n.locale }
    end

end
