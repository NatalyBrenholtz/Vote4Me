module FoundationHelper
  def display_flash_messages(key_matching = {})
    key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)

    flash.inject "" do |message, (key, value)|
      message += content_tag :div, :data => { :alert => "" }, :class => "alert-box radius #{key_matching[key] || :standard}" do
        (value + link_to("&times;".html_safe, "#", :class => :close, title: I18n.t('close'))).html_safe
      end
    end.html_safe
  end
end