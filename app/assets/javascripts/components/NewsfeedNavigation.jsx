class NewsfeedNavigation extends React.Component {

  constructor(props) {
    super(props);
  }

  onToggleNewPostArea() {
    this.props.toggleNewPostArea();
  }

  render(){
    return (
        <span>
          <nav className="level">
            <div className="level-left">
            </div>
            <div className="level-right">
              <div className="level-item">
                <a className="button has-icon" onClick={this.onToggleNewPostArea.bind(this)}>
                  <span>New</span>
                  <span className="icon">
                    <i className="fa fa-caret-down">
                    </i>
                  </span>
                </a>
              </div>
            </div>
          </nav>
        </span>
    );
  }
}