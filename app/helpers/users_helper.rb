module UsersHelper
 def is_joel?
  (!current_user.nil? && current_user.username == 'joel' ) ? true : false
 end
end
