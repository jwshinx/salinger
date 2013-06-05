Salinger.Views.Emails ||= {}

class Salinger.Views.Emails.EditView extends Backbone.View
  template : JST["backbone/templates/emails/edit"]

  events :
    "submit #edit-email" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (email) =>
        @model = email
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
