open = require 'open'

module.exports =
  activate: ->
    atom.workspaceView.command 'search:google', =>
      url = @getSearchUrl('google')
      console.log url
      open(url)
    atom.workspaceView.command 'search:ddg', =>
      url = @getSearchUrl('duckduckgo')
      console.log url
      open(url)
    atom.workspaceView.command 'search:twitter', =>
      url = @getSearchUrl('twitter')
      console.log url
      open(url)
    atom.workspaceView.command 'search:github', =>
      url = @getSearchUrl('github')
      console.log url
      open(url)
    atom.workspaceView.command 'search:stackoverflow', =>
      url = @getSearchUrl('stackoverflow')
      console.log url
      open(url)

  baseSearchUrls:
    google: 'https://www.google.com/'
    duckduckgo: 'https://www.duckduckgo.com/'
    twitter: 'https://twitter.com/search'
    github: 'https://github.com/search'
    stackoverflow: 'http://stackoverflow.com/search'

  searchPrefixes:
    google: '#q='
    duckduckgo: '?q='
    twitter: '?q='
    github: '?q='
    stackoverflow: '?q='

  getSearchTerm: ->
    # assumes an editor is in focus
    editor = atom.workspaceView.getActivePaneItem()
    searchText = editor.getSelectedText()

  getSearchUrl: (site) ->
    searchTerm = @getSearchTerm()
    if searchTerm == ""
      @baseSearchUrls[site]
    else
      encodeURI(@baseSearchUrls[site] + @searchPrefixes[site] + searchTerm)

  # activate: (state) ->
  #   @searchView = new SearchView(state.searchViewState)
  #
  # deactivate: ->
  #   @searchView.destroy()
