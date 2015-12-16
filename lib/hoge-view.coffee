
{View} = require 'atom-space-pen-views'

module.exports =
class HogeView extends View
  @content: ->
    @div =>
      @h1 "HGOEHOGEHOGH"
      @div class: 'snippets', outlet: 'snippets'

  initialize: ->
    @width(400)
    @getSnippet()

  getSnippet: =>
    div = @snippets
    snippets = [
      { id: 'hoge', code: 'ABC' },
      { id: 'fuga', code: 'DEF' },
      { id: 'heah', code: 'GHI' }
    ]
    snippets.forEach (snippet) ->
      div.append("<h1>" + snippet.id + "</h1> <pre>" + snippet.code + "</pre>")
