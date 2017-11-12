import React from 'react'

export default class Lockscreen extends React.Component {

  constructor(props) {
    super(props);
  }

  render(){
    return(
        <div className="modal is-active" style={{zIndex: 9999}}>
          <div className="modal-background" style={{backgroundImage: "url('https://cdn.pixabay.com/photo/2017/09/24/19/20/moorabbis-2782862_1280.jpg')"}}>

          </div>
          <div className="modal-content">
            <div className="box has-text-centered">
              <div className="field">
                <p className="image is-128x128" style={{margin: "auto "}}>
                  <img style={{borderRadius: "50%"}} src="https://scontent.ftxl1-1.fna.fbcdn.net/v/t1.0-9/10462372_883074528426654_8559815598301621347_n.jpg?oh=fdd12a6b6c3545d4ed9d261d7a1b0323&oe=5A67FFC9" />
                </p>
              </div>
              <h1 className="subtitle is-2">{this.props.user.username}</h1>
              <h2 className="subtitle is-4">{new Date().toLocaleString()}</h2>
              <div className="control has-icons-left">
                <input className="input is-medium" type="password" placeholder="Password">

                </input>
                <span className="icon is-left">
                  <i className="fa fa-lock">
                  </i>
                </span>
              </div>
              <hr>

              </hr>
              <nav className="level">
                <div className="level-left">
                  <div className="level-item">

                  </div>
                </div>
                <div className="level-right">
                  <div className="level-item">
                    <form action="/logout" method="POST">
                      <button className="button is-text" type="submit">Not {this.props.user.username} ?</button>
                    </form>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
    )
  }
}