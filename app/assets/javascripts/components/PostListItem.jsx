class PostListItem extends React.Component {
  constructor(){
      super();
      this.state = {commentArea: { active: false}}
  }

  componentDidMount(){

  }


  render() {

    return (
        <div>
            <article className="media">
                <div className="media-content">
                    <nav className="level is-mobile" style={{marginBottom: '12px'}}>
                        <div className="level-left">
                            <div className="level-item">
                                <p className="image is-64x64">
                                    <img src="https://bulma.io/images/placeholders/128x128.png" />
                                </p>
                            </div>
                            <div className="level-item">
                                <h4><strong>{this.props.obj.user.firstname + " " + this.props.obj.user.lastname}</strong><small> wrote:</small></h4>
                            </div>
                        </div>
                        <div className="level-right">
                            <div className="level-item">

                            </div>
                        </div>
                    </nav>
                    <div className="content">
                        <p>
                            {this.props.obj.content}
                            <br />
                            <small><a>Like</a> · <a onClick={()=>{this.setState({commentArea: { active: !this.state.commentArea.active}})}}>Reply</a> · 3 hrs</small>
                        </p>
                    </div>
                    <div className="tags">
                        <a className="tag">One</a>
                        <a className="tag">Two</a>
                        <a className="tag">Three</a>
                        <a className="tag">Four</a>
                        <a className="tag">Five</a>
                        <a className="tag">Five</a>
                        <a className="tag">Five</a>
                        <a className="tag">Five</a>
                        <a className="tag">Five</a>
                    </div>
                    {
                        this.props.obj.comments.map(comment => { return ( <PostComment obj={comment} key={comment.id} />)})
                    }
                    {
                      this.state.commentArea.active === true && <PostCommentArea/>
                    }

                </div>
            </article>
            <hr></hr>
        </div>
    );
  }
}