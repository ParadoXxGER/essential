import React from 'react'
import PostAddonChooser from "./PostAddonChooser";
import {MegadraftEditor, editorStateFromRaw, editorStateToJSON} from "megadraft";

import 'megadraft/dist/css/megadraft.css';

export default class PostNew extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      post: {
        text: "",
        links: [],
      },
      editorState: editorStateFromRaw(null)
    };

    this.onChange = this.onChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.onToggleNewPostArea = this.onToggleNewPostArea.bind(this);
    this.onPostCreated = this.onPostCreated.bind(this);
  }

  onChange(editorState) {
    var post = { "text": editorStateToJSON(editorState)};
    this.setState({ post: post });
    this.setState({editorState});
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

  render(){
    const { editorState } = this.state;

    return (
      <article className="media">
        <div className="media-content">
          <nav className="level is-mobile" style={{marginBottom: '12px'}}>
            <div className="level-left">
              <div className="level-item">
                <p className="image is-48x48" >
                  <img style={{borderRadius: "50%"}} src="https://scontent-frx5-1.xx.fbcdn.net/v/t1.0-1/c1.0.40.40/p40x40/10462372_883074528426654_8559815598301621347_n.jpg?oh=7ecebca21425321713c62a1787f3867e&oe=5AA3A0B6" />
                </p>
              </div>
              <div className="level-item">
                <strong>
                  Niklas Hanft
                </strong>
              </div>
            </div>
            <div className="level-right">
            </div>
          </nav>
          <div className="field">
            <p className="control">
              <MegadraftEditor
                editorState={this.state.editorState}
                onChange={this.onChange}
              />
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