class Salinger.Models.Email extends Backbone.Model
  paramRoot: 'email'

  defaults:
    content: null
    email_type_id: null
    #created_at: null 
    #updated_at: null 

class Salinger.Collections.EmailsCollection extends Backbone.Collection
  model: Salinger.Models.Email
  url: '/emails'
