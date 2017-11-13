import React from 'react'
export default class PostComment extends React.Component {
    render (){

        return(
            <article className="media" style={{marginLeft: '30px'}}>
                <div className="media-content">
                    <nav className="level is-mobile" style={{marginBottom: '12px'}}>
                        <div className="level-left">
                            <div className="level-item">
                                <p className="image is-32x32">
                                    <img style={{borderRadius: "50%"}} src="https://scontent-frx5-1.xx.fbcdn.net/v/t1.0-1/c1.0.40.40/p40x40/10462372_883074528426654_8559815598301621347_n.jpg?oh=7ecebca21425321713c62a1787f3867e&oe=5AA3A0B6" />
                                </p>
                            </div>
                            <div className="level-item">
                                <h4><strong>{this.props.obj.user.firstname} {this.props.obj.user.lastname}</strong></h4>
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