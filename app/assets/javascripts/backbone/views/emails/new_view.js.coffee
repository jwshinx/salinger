Salinger.Views.Emails ||= {}

class Salinger.Views.Emails.NewView extends Backbone.View
  template: JST["backbone/templates/emails/new"]

  events:
    "submit #new-email": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (email) =>
        @model = email
        window.location.hash = "/#{@model.id}"

      error: (email, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
