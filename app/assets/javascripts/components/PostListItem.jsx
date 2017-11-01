class PostListItem extends React.Component {
    render() {
        var a = [0,1];
        return (
            <div>
                <article className="media">
                    <div className="media-content">
                        <nav className="level is-mobile" style={{marginBottom: '12px'}}>
                            <div className="level-left">
                                <div className="level-item">
                                    <p className="image is-64x64">
                                        <img src="https://bulma.io/images/placeholders/128x128.png" />
                                    </p>
                                </div>
                                <div className="level-item">
                                    <h4><strong>Barbara Middleton</strong><small> wrote:</small></h4>
                                </div>
                            </div>
                            <div className="level-right">
                                <div className="level-item">

                                </div>
                            </div>
                        </nav>
                        <div className="content">
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta eros lacus, nec ultricies elit blandit non. Suspendisse pellentesque mauris sit amet dolor blandit rutrum. Nunc in tempus turpis.
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta eros lacus, nec ultricies elit blandit non. Suspendisse pellentesque mauris sit amet dolor blandit rutrum. Nunc in tempus turpis.
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta eros lacus, nec ultricies elit blandit non. Suspendisse pellentesque mauris sit amet dolor blandit rutrum. Nunc in tempus turpis.
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis porta eros lacus, nec ultricies elit blandit non. Suspendisse pellentesque mauris sit amet dolor blandit rutrum. Nunc in tempus turpis.
                                <br />
                                <small><a>Like</a> · <a>Reply</a> · 3 hrs</small>
                            </p>
                        </div>
                        <div className="tags">
                            <a className="tag">One</a>
                            <a className="tag">Two</a>
                            <a className="tag">Three</a>
                            <a className="tag">Four</a>
                            <a className="tag">Five</a>
                            <a className="tag">Five</a>
                            <a className="tag">Five</a>
                            <a className="tag">Five</a>
                            <a className="tag">Five</a>
                        </div>
                        {
                            a.map(i => { return ( <PostComment key={i} />)})
                        }
                        <PostCommentArea/>
                    </div>
                </article>
                <hr></hr>
            </div>
        );
    }
}