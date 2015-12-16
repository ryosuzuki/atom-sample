
{View} = require 'atom-space-pen-views'

module.exports =
class HogeView extends View
  @content: ->
    @div =>
      @h1 "HGOEHOGEHOGH"
      @pre "def hoge\n  return 'hoge'\nend"
