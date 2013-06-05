Salinger.Views.Emails ||= {}

class Salinger.Views.Emails.EmailView extends Backbone.View
  template: JST["backbone/templates/emails/email"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
