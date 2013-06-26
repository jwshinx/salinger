module OrderStatusesHelper
 def make_link display_text, model, ability, object, url_token
  if can? ability, model
   content_tag(:span, display_text)
  else
   content_tag(:a, display_text, :href => "/#{url_token}/#{object.id}") 
  end
 end
end
