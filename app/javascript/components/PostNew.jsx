import React from 'react'
import PostAddonChooser from "./PostAddonChooser";

export default class PostNew extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      post: {
        text: ""
      }
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onToggleNewPostArea = this.onToggleNewPostArea.bind(this);
    this.onPostCreated = this.onPostCreated.bind(this);
  }

  onToggleNewPostArea() {
    this.props.toggleNewPostArea();
  }

  createPost(){
    this.props.showLoadingSpinner();
    fetch('/api/v1/posts'+window.location.search, {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      method: 'POST',
      body: JSON.stringify({
        "text": this.state.post.text
      })
    }).then(() => {
      this.onToggleNewPostArea();
      this.onPostCreated();
    }).then(function(data) {

    })
    ;
  }

  onPostCreated(){
    this.props.getPosts();
  }

  handleSubmit(){
    event.preventDefault();
    this.createPost();
  }

  handleChange(e) {
    var post = { "text": e.target.value };
    this.setState({post: post});
  }

  render(){
    return (
      <article className="media">
        <div className="media-content">
          <div className="field">
            <p className="control">
              <textarea className="textarea" onChange={this.handleChange} value={this.state.post.text} placeholder="Write something!" rows="4"/>
            </p>
          </div>
          <nav className="level">
            <div className="level-left">
              <div className="level-item">
                <PostAddonChooser/>
              </div>
            </div>
            <div className="level-right">
              <div className="level-item">
                <p className="field">
                  <button className="button is-outlined is-danger" onClick={this.onToggleNewPostArea}>
                    <span className="icon">
                      <i className="fa fa-times">

                      </i>
                    </span>
                    <span>Cancel</span>
                  </button>
                </p>
              </div>
              <div className="level-item">
                <button onClick={this.handleSubmit} className="button is-outlined is-success">
                  <span className="icon">
                    <i className="fa fa-save">

                    </i>
                  </span>
                  <span>Save</span>
                </button>
              </div>
            </div>
          </nav>
        </div>
      </article>
    )
  }
}