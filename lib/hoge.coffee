HogeView = require './hoge-view'
{CompositeDisposable} = require 'atom'

module.exports = Hoge =
  hogeView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @hogeView = new HogeView(state.hogeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @hogeView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'hoge:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @hogeView.destroy()

  serialize: ->
    hogeViewState: @hogeView.serialize()

  toggle: ->
    console.log 'Hoge was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
