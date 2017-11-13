import React from 'react'
import NewPostChooser from "./NewPostChooser";

export default class NewsfeedNavigation extends React.Component {

  constructor(props) {
    super(props);
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
                <NewPostChooser toggleNewPostArea={this.props.toggleNewPostArea}/>
              </div>
            </div>
          </nav>
        </span>
    );
  }
}