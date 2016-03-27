# @cjsx React.DOM

@Post = React.createClass
  displayName: 'Post'


  render: ->
    fullWidth = this.props.fullWidth
    post = this.props.post

    fullWidthHtml =
      <div className="col-sm-12">
        <div className="card card-fullwidth text-xs-center" >
          <div className="card-block text-xs-center">
            <h4 className="card-title">{ post.title }</h4>
          </div>
          <div className="card-block">
            <p className="card-text">{ post.body }</p>
              <a  ref="back" className="btn btn-sm btn-primary" onClick={@props.handleIndexPage}>Back to Posts</a>
          </div>
          <div className="card-footer text-xs-center text-muted">
            <span>created by <b>{ post.created_by }</b> { post.created_at } ago</span>
          </div>
        </div>
      </div>

    normalWidthHtml =
      <div className="col-sm-12 col-md-6 col-lg-4">
        <div className="card text-xs-center">
          <div className="card-block text-xs-center">
            <h4 className="card-title">{ post.title }</h4>
          </div>
          <div className="card-block">
            <p className="card-text">{ post.truncated_body }</p>
              <a href={post.url} ref="link" className="btn btn-sm btn-primary" onClick={@props.handleShowPage}>Read more...</a>
          </div>
          <div className="card-footer text-xs-center text-muted">
            <span>created by <b>{ post.created_by }</b> { post.created_at } ago</span>
          </div>
        </div>
      </div>

    if fullWidth
      return fullWidthHtml
    else
      return normalWidthHtml

