module Trackable
 def set_creator object, user
  object.creator = user
 end
 def set_updater object, user
  object.updater = user
 end
 def set_creator_and_updater object, user
  set_creator object, user
  set_updater object, user
 end
end
