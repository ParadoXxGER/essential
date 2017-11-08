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
                                <p className="image is-48x48 is-circle" >
                                    <img style={{borderRadius: "50%"}} src="https://scontent-frx5-1.xx.fbcdn.net/v/t1.0-1/c1.0.40.40/p40x40/10462372_883074528426654_8559815598301621347_n.jpg?oh=7ecebca21425321713c62a1787f3867e&oe=5AA3A0B6" />
                                </p>
                            </div>
                            <div className="level-item">
                              <strong>
                                {this.props.obj.user.firstname + " " + this.props.obj.user.lastname}
                                <small> wrote:</small>
                              </strong>
                            </div>
                        </div>
                        <div className="level-right">
                            <div className="level-item">
                              <div className="dropdown is-hoverable is-right">
                                <div className="dropdown-trigger">
                                  <button className="button" aria-haspopup="true" aria-controls="dropdown-menu">
                                    <span className="icon">
                                      <i className="fa fa-cog">

                                      </i>
                                    </span>
                                  </button>
                                </div>
                                <div className="dropdown-menu" id="dropdown-menu" role="menu">
                                  <div className="dropdown-content">
                                    <a href="#" className="dropdown-item has-icon">
                                      <span className="icon">
                                         <i className="fa fa-star" aria-hidden="true">

                                         </i>
                                      </span>
                                      Mark as favorite
                                    </a>
                                    <a className="dropdown-item has-icon">
                                      <span className="icon">
                                         <i className="fa fa-bullhorn" aria-hidden="true">

                                         </i>
                                      </span>
                                      Report post
                                    </a>
                                    <hr className="dropdown-divider"></hr>
                                      <a href="#" className="dropdown-item has-icon">
                                        <span className="icon">
                                           <i className="fa fa-eye-slash" aria-hidden="true">

                                           </i>
                                        </span>
                                        Hide post
                                      </a>
                                  </div>
                                </div>
                              </div>
                            </div>
                        </div>
                    </nav>
                    <div className="content">
                        <p>
                            {this.props.obj.content}
                            <br />
                            <small><a>Like</a> · <a onClick={()=>{this.setState({commentArea: { active: !this.state.commentArea.active}})}}>Reply</a> · {this.props.obj.created_at}</small>
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