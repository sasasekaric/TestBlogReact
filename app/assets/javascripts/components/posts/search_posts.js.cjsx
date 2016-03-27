# @cjsx React.DOM

@SearchPosts = React.createClass
  displayName: 'SearchPosts'

  handleSearch: (e) ->
    e.preventDefault()
    @props.handleSearch(e.target.value.trim())
    # if @refs.searchQuery.value.trim() != ''
    #   @props.handleSearch(@refs.searchQuery.value.trim())

  render: ->
    <form className="searchForm form" ref='searchPostsForm'  >
      <div className="row">
        <div className="form-group col-xs-12 col-md-8 col-lg-6 col-md-offset-2 col-lg-offset-3">
          <input className="form-control" onKeyUp={@handleSearch} type="text" placeholder="Search posts by title" ref='searchQuery'  />
        </div>
      </div>
    </form>
