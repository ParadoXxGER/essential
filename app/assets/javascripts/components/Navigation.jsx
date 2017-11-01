class Navigation extends React.Component {
    render() {
        function scrollUp(e) {
            e.preventDefault();
            window.scrollTo(0, 0);
        }
        function scrollDown(e) {
            e.preventDefault();
            window.scrollTo(0,document.body.scrollHeight);
        }

        return (
            <div className="container">
                <nav className="navbar is-transparent">
                    <div className="navbar-brand">
                        <a className="navbar-item" href="https://bulma.io">
                            <img src="https://bulma.io/images/bulma-logo.png"
                                 alt="Bulma: a modern CSS framework based on Flexbox" width={112} height={28}/>
                        </a>
                        <a className="navbar-item is-hidden-desktop" onClick={scrollUp}>
                        <span className="icon" style={{color: '#333'}}>
                          <i className="fa fa-arrow-up"/>
                        </span>
                        </a>
                        <a className="navbar-item is-hidden-desktop" onClick={scrollDown}>
                        <span className="icon" style={{color: '#333'}}>
                          <i className="fa fa-arrow-down"/>
                        </span>
                        </a>
                        <div className="navbar-burger burger" data-target="navMenuTransparentExample">
                            <span/>
                            <span/>
                            <span/>
                        </div>
                    </div>
                    <div id="navMenuTransparentExample" className="navbar-menu">
                        <div className="navbar-start">
                            <div className="navbar-item has-dropdown is-hoverable">
                                <a className="navbar-link  is-active" href="/documentation/overview/start/">
                                    Docs
                                </a>
                                <div className="navbar-dropdown is-boxed">
                                    <a className="navbar-item " href="/documentation/overview/start/">
                                        Overview
                                    </a>
                                    <a className="navbar-item " href="https://bulma.io/documentation/modifiers/syntax/">
                                        Modifiers
                                    </a>
                                    <a className="navbar-item " href="https://bulma.io/documentation/columns/basics/">
                                        Columns
                                    </a>
                                    <a className="navbar-item " href="https://bulma.io/documentation/layout/container/">
                                        Layout
                                    </a>
                                    <a className="navbar-item " href="https://bulma.io/documentation/form/general/">
                                        Form
                                    </a>
                                    <a className="navbar-item " href="https://bulma.io/documentation/elements/box/">
                                        Elements
                                    </a>
                                    <a className="navbar-item is-active"
                                       href="https://bulma.io/documentation/components/breadcrumb/">
                                        Components
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <div className="navbar-item">
                                        <div>
                                            <p className="is-size-6-desktop">
                                                <strong>0.6.0</strong>
                                            </p>
                                            <small>
                                                <a className="bd-view-all-versions" href="https://versions.bulma.io/">View
                                                    all versions</a>
                                            </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="navbar-item has-dropdown is-hoverable">
                                <a className="navbar-link " href="https://bulma.io/blog/">
                                    Blog
                                </a>
                                <div id="blogDropdown" className="navbar-dropdown is-boxed" data-style="width: 18rem;">
                                    <a className="navbar-item" href="/2017/10/09/roses-are-red-links-are-blue/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">09 Oct 2017</small>
                                            </p>
                                            <p>Roses are red – Links are blue</p>
                                        </div>
                                    </a>
                                    <a className="navbar-item" href="/2017/08/03/list-of-tags/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">03 Aug 2017</small>
                                            </p>
                                            <p>New feature: list of tags</p>
                                        </div>
                                    </a>
                                    <a className="navbar-item" href="/2017/08/01/bulma-bootstrap-comparison/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">01 Aug 2017</small>
                                            </p>
                                            <p>Bulma / Bootstrap comparison</p>
                                        </div>
                                    </a>
                                    <a className="navbar-item" href="https://bulma.io/blog/">
                                        More posts
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <div className="navbar-item">
                                        <div className="navbar-content">
                                            <div className="level is-mobile">
                                                <div className="level-left">
                                                    <div className="level-item">
                                                        <strong>Stay up to date!</strong>
                                                    </div>
                                                </div>
                                                <div className="level-right">
                                                    <div className="level-item">
                                                        <a className="button bd-is-rss is-small"
                                                           href="https://bulma.io/atom.xml">
                            <span className="icon is-small">
                              <i className="fa fa-rss"/>
                            </span>
                                                            <span>Subscribe</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="navbar-item has-dropdown is-hoverable">
                                <div className="navbar-link">
                                    More
                                </div>
                                <div id="moreDropdown" className="navbar-dropdown is-boxed">
                                    <a className="navbar-item " href="https://bulma.io/bulma-start/">
                                        <p>
                                            <strong>Bulma start</strong>
                                            <br/>
                                            <small>A tiny npm package to get started</small>
                                        </p>
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <a className="navbar-item " href="https://bulma.io/made-with-bulma/">
                                        <p>
                                            <strong>Made with Bulma</strong>
                                            <br/>
                                            <small>The official community badge</small>
                                        </p>
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <a className="navbar-item " href="https://bulma.io/extensions/">
                                        <p>
                                            <strong>Extensions</strong>
                                            <br/>
                                            <small>Side projects to enhance Bulma</small>
                                        </p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="navbar-end">
                            <div className="navbar-item">
                                <div className="field is-grouped">
                                    <p className="control">
                                        <a className="button is-danger"
                                           href="https://github.com/jgthms/bulma/releases/download/0.6.0/bulma-0.6.0.zip">
                                        <span className="icon">
                                          <i className="fa fa-sign-out"/>
                                        </span>
                                            <span>Logout</span>
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        );
    }
}