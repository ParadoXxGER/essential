class PostComment extends React.Component {
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
                                <h4><strong>Niklas Hanft</strong><small> commented:</small></h4>
                            </div>
                        </div>
                    </nav>
                    <div className="content">
                        <p>
                            Sed convallis scelerisque mauris, non pulvinar nunc mattis vel. Maecenas varius felis sit amet magna vestibulum euismod malesuada cursus libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacinia non nisl id feugiat.
                            <br />
                            <small><a>Like</a> · <a>Reply</a> · 2 hrs</small>
                        </p>
                    </div>
                </div>
            </article>
        )
    }
}