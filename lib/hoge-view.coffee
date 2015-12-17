
request = require 'request'
parse = require 'diff-parse'
hljs = require 'highlight.js'
{ScrollView} = require 'atom-space-pen-views'



module.exports =
class HogeView extends ScrollView
  @content: ->
    @div class: 'hoge-view', =>
      @h1 "HGOEHOGEHOGH"
      @div class: 'snippets', outlet: 'snippets'

  initialize: ->
    @width(400)
    @getSnippet()

  getSnippet: =>
    div = @snippets
    request 'http://localhost:3000/arguments', (err, res, body) ->
      json = JSON.parse body
      snippets = json.commits
      snippets.forEach (snippet) ->
        div.append('<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.0.0/styles/default.min.css">')
        div.append("<h1>" + snippet.message + "</h1><p>(" + snippet.id + ")</p>")
        files = parse(snippet.patch)
        files.forEach (file) ->
          if (file.to)
            content = ''
            file.lines.forEach (line) ->
              if line.del
                content += '+ '
              else if line.add
                content += '+ '
              else
                content += '  '
              content += line.content
              content += "\n"
            div.append("<h2>" + file.from + "</h2><pre>" + hljs.highlight('diff', content).value + "</pre>")
