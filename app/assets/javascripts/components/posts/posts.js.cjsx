# @cjsx React.DOM

@Posts = React.createClass
  displayName: 'Post'


  render: ->

    postNodes = @props.posts.map (post) =>
      <Post key={post.id} post={post} handleIndexPage={@props.handleIndexPage} handleShowPage={@props.handleShowPage} fullWidth={@props.fullWidth} />

    <div className="row posts">
      {postNodes}
    </div>
