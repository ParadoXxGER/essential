import React from 'react'

export default class NewPostChooser extends React.Component {

  constructor(props){
    super(props);
  }

  onToggleNewPostArea() {
    this.props.toggleNewPostArea();
  }

  render (){

    return(
      <div>
        <div className="dropdown is-hoverable is-right">
          <div className="dropdown-trigger">
            <button className="button has-icon" aria-haspopup="true" aria-controls="dropdown-menu">
              New
            </button>
          </div>
          <div className="dropdown-menu" id="dropdown-menu" role="menu">
            <div className="dropdown-content" style={{maxHeight: "400px", overflowX: "scroll"}}>
              <a className="dropdown-item has-icon" onClick={this.onToggleNewPostArea.bind(this)}>
                <p>
                  <span className="icon">
                   <i className="fa fa-newspaper-o" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Text</strong>
                  <br/>
                  <small>A simple text post</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-file" aria-hidden="true">
                   </i>
                  </span>
                  <strong>File</strong>
                  <br/>
                  <small>Upload a file</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-table" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Table</strong>
                  <br/>
                  <small>Share a table of data</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-line-chart" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Graph</strong>
                  <br/>
                  <small>Create a graph</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-video-camera" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Video</strong>
                  <br/>
                  <small>Embedd a video</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-image" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Photo gallery</strong>
                  <br/>
                  <small>Share a gallery of photos</small>
                </p>
              </a>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-link" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Link</strong>
                  <br/>
                  <small>Generate a preview of a http link.</small>
                </p>
              </a>
              <hr className="navbar-divider"/>
              <a className="dropdown-item has-icon">
                <p>
                  <span className="icon">
                   <i className="fa fa-warning" aria-hidden="true">
                   </i>
                  </span>
                  <strong>Warning</strong>
                  <br/>
                  <small>Create a important, highlighted post</small>
                </p>
              </a>
            </div>
          </div>
        </div>
      </div>
    )
  }
}