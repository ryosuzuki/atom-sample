HogeView = require './hoge-view'
{CompositeDisposable} = require 'atom'

module.exports = Hoge =
  hogeView: null

  activate: ->
    atom.commands.add 'atom-workspace', 'hoge:open', => @open()
    atom.commands.add 'atom-workspace', 'hoge:close', => @close()
    # alert('FJFOJEWO')
    console.log(@hogeView)
    @hogeView = new HogeView()
    @modalPanel = atom.workspace.addRightPanel(item: @hogeView, visible: true, className: 'hoge-panel')

  open: ->
    editor = atom.workspace.getActivePaneItem()
    cursors = editor.getCursors()
    editor.insertText('GHOWJOJGEOJGEOJGEOJO')

  deactivate: ->

  serialize: ->

  toggle: ->
    console.log 'Hoge was toggled!'
    activate()
