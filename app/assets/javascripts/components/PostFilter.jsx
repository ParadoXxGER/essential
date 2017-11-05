class PostFilter extends React.Component {

    constructor(props) {
      super(props);
    }

    onToggleNewPostArea() {
      this.props.toggleNewPostArea();
    }

    render(){
        return (
            <nav className="level">
                <div className="level-left is-hidden-mobile">
                    <p className="level-item"><strong>Filter:</strong></p>
                    <p className="level-item"><a>Published</a></p>
                    <p className="level-item"><a>Drafts</a></p>
                    <p className="level-item"><a>Deleted</a></p>
                </div>
                <div className="level-right">
                    <p className="level-item">
                        <a className="button is-success" onClick={this.onToggleNewPostArea.bind(this)}>
                            <span>Write a new Post</span>
                            <span className="icon">
                              <i className="fa fa-pencil"></i>
                            </span>
                        </a>
                    </p>
                    <p className="level-item"><a>Reset all filter</a></p>
                </div>
            </nav>
        );
    }
}