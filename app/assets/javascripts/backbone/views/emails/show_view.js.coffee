Salinger.Views.Emails ||= {}

class Salinger.Views.Emails.ShowView extends Backbone.View
  template: JST["backbone/templates/emails/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
