Salinger.Views.Emails ||= {}

class Salinger.Views.Emails.IndexView extends Backbone.View
  template: JST["backbone/templates/emails/index"]

  initialize: () ->
    @options.emails.bind('reset', @addAll)

  addAll: () =>
    @options.emails.each(@addOne)

  addOne: (email) =>
    view = new Salinger.Views.Emails.EmailView({model : email})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(emails: @options.emails.toJSON() ))
    @addAll()

    return this
