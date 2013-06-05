class Salinger.Routers.EmailsRouter extends Backbone.Router
  initialize: (options) ->
    @emails = new Salinger.Collections.EmailsCollection()
    @emails.reset options.emails

  routes:
    "new"      : "newEmail"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newEmail: ->
    @view = new Salinger.Views.Emails.NewView(collection: @emails)
    $("#emails").html(@view.render().el)

  index: ->
    @view = new Salinger.Views.Emails.IndexView(emails: @emails)
    $("#emails").html(@view.render().el)

  show: (id) ->
    email = @emails.get(id)

    @view = new Salinger.Views.Emails.ShowView(model: email)
    $("#emails").html(@view.render().el)

  edit: (id) ->
    email = @emails.get(id)

    @view = new Salinger.Views.Emails.EditView(model: email)
    $("#emails").html(@view.render().el)
