class PostNew extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      post: {
        text: ""
      }
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  createPost(){
    fetch('/api/v1/text_posts', {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      method: 'POST',
      body: JSON.stringify({
        "text": this.state.post.text
      })
    }).then(function(response) {
      this.props.toggleNewPostArea();
    }).then(function(data) {

    });
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
              <textarea className="textarea" onChange={this.handleChange} value={this.state.post.text} placeholder="Write something!" rows="6"/>
            </p>
          </div>
          <div className="field">
            <p className="control">
              <button onClick={this.handleSubmit} className="button">Create</button>
            </p>
          </div>
        </div>
      </article>
    )
  }
}