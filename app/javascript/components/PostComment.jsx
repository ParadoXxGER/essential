import React from 'react'
export default class PostComment extends React.Component {
    render (){

        return(
            <article className="media" style={{marginLeft: '30px'}}>
                <div className="media-content">
                    <nav className="level is-mobile" style={{marginBottom: '12px'}}>
                        <div className="level-left">
                            <div className="level-item">
                                <p className="image is-48x48">
                                    <img src="https://bulma.io/images/placeholders/128x128.png" />
                                </p>
                            </div>
                            <div className="level-item">
                                <h4><strong>{this.props.obj.user.username}</strong></h4>
                            </div>
                        </div>
                    </nav>
                    <div className="content">
                        <p>
                          {this.props.obj.text}
                            <br />
                            <small><a>Like</a> · posted 2 hrs ago</small>
                        </p>
                    </div>
                </div>
            </article>
        )
    }
}