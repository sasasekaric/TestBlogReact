# @cjsx React.DOM

@PostsContainer = React.createClass
  displayName: 'PostsContainer'

  getInitialState: ->
    return { didFetchData: false, posts: [], fullWidth: false }

  handleShowPage: (e) ->
    e.preventDefault()
    url = e.target.href
    @_fetchPosts(url, {})

  handleIndexPage: (e) ->
    e.preventDefault()
    @_fetchPosts('/posts', {})

  handleSearch: (query) ->
    @_searchPosts(query)

  componentWillMount: ->
    @_fetchPosts('/posts', {})

  _fetchPosts: (url, data)->
    $.ajax
      url: url
      dataType: 'json'
      data: data
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _searchPosts: (query)->
    $.ajax
      method: 'PATCH'
      url: '/posts/search'
      dataType: 'json'
      data: {q: query}
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    if typeof data.posts == 'object'
      @setState { didFetchData: true, posts: data.posts, fullWidth: false }
    else
      @setState { didFetchData: true, posts: [data], fullWidth: true }

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  render: ->
    <div>
      <SearchPosts handleSearch={@handleSearch} />
      <Posts posts={@state.posts} handleIndexPage={@handleIndexPage} handleShowPage={@handleShowPage} fullWidth={@state.fullWidth} />
    </div>
