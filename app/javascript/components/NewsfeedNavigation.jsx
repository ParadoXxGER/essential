import React from 'react'

export default class NewsfeedNavigation extends React.Component {

  constructor(props) {
    super(props);
  }

  onToggleNewPostArea() {
    this.props.toggleNewPostArea();
  }

  render(){
    return (
        <span>
          <nav className="level is-mobile">
            <div className="level-left">
              <h2 className="title">Newsfeed:</h2>
            </div>
            <div className="level-right">
              <div className="level-item">
                <button className="button" onClick={this.onToggleNewPostArea.bind(this)}>
                  Create
                </button>
              </div>
            </div>
          </nav>
        </span>
    );
  }
}