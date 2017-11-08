class PostChooser extends React.Component {
  render (){

    return(
      <div>
        <div className="columns" style={{overflowX: "scroll"}}>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Image</h3>
                <span className="icon ">
                  <i className="fa fa-image fa-3x"></i>
                </span>
              </div>
            </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Event</h3>
                <span className="icon ">
                  <i className="fa fa-calendar fa-3x"></i>
                </span>
              </div>
            </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Contact</h3>
                <span className="icon ">
                  <i className="fa fa-address-card fa-3x"></i>
                </span>
              </div>
            </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Text</h3>
                <span className="icon ">
                  <i className="fa fa-comment fa-3x"></i>
                </span>
              </div>
            </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Question</h3>
                <span className="icon ">
                  <i className="fa fa-question fa-3x"></i>
                </span>
              </div>
            </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">File</h3>
                <span className="icon ">
                  <i className="fa fa-file fa-3x"></i>
                </span>
              </div>
              </a>
          </div>

          <div className="column is-2">
            <a>
              <div className="box has-text-centered">
                <h3 className="subtitle is-3">Link</h3>
                <span className="icon ">
                  <i className="fa fa-external-link fa-3x"></i>
                </span>
              </div>
            </a>
          </div>












        </div>
      </div>
    )
  }
}