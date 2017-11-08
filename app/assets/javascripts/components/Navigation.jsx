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
                        <a className="navbar-item">
                            <img src="https://bulma.io/images/bulma-logo.png"
                                 alt="Essential Intranet" width={112} height={28}/>
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
                                <div className="navbar-link">
                                    Pages
                                </div>
                                <div id="moreDropdown" className="navbar-dropdown is-boxed">
                                    <a className="navbar-item ">
                                        <p>
                                            <strong>Unternehmenskommunikation</strong>
                                            <br/>
                                            <small>A tiny npm package to get started</small>
                                        </p>
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <a className="navbar-item ">
                                        <p>
                                            <strong>Wir über uns</strong>
                                            <br/>
                                            <small>The official community badge</small>
                                        </p>
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <a className="navbar-item ">
                                        <p>
                                            <strong>Marketing</strong>
                                            <br/>
                                            <small>Side projects to enhance Essential</small>
                                        </p>
                                    </a>
                                </div>
                            </div>
                            <div className="navbar-item">
                                <a className="navbar-link is-active">
                                    Colleagues
                                </a>
                            </div>
                        </div>
                        <div className="navbar-end">
                            <div className="navbar-item has-dropdown is-hoverable">
                                <a className="navbar-link " href="https://bulma.io/blog/">
                                    Notifications
                                </a>
                                <div id="blogDropdown" className="navbar-dropdown is-boxed" data-style="width: 18rem;">
                                    <a className="navbar-item" href="/2017/10/09/roses-are-red-links-are-blue/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">09 Oct 2017</small>
                                            </p>
                                            <p>Niklas Hanft shared a file</p>
                                        </div>
                                    </a>
                                    <a className="navbar-item" href="/2017/08/03/list-of-tags/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">03 Aug 2017</small>
                                            </p>
                                            <p>Niklas Hanft posted a photo album</p>
                                        </div>
                                    </a>
                                    <a className="navbar-item" href="/2017/08/01/bulma-bootstrap-comparison/">
                                        <div className="navbar-content">
                                            <p>
                                                <small className="has-text-link">01 Aug 2017</small>
                                            </p>
                                            <p>Niklas Hanft shared a link</p>
                                        </div>
                                    </a>
                                    <hr className="navbar-divider"/>
                                    <div className="navbar-item">
                                        <div className="navbar-content">
                                            <div className="level is-mobile">
                                                <div className="level-left">
                                                    <div className="level-item">
                                                        <a className="button bd-is-rss is-small"
                                                           href="https://bulma.io/atom.xml">
                                                            <span className="icon is-small">
                                                              <i className="fa fa-check"/>
                                                            </span>
                                                            <span>Mark all as read</span>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div className="level-right">
                                                    <a>Show all</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="navbar-item">
                                <div className="field is-grouped">
                                    <p className="control">
                                        <form action="/logout" method="POST">
                                          <button type="submit" className="button is-link">
                                          <span className="icon">
                                            <i className="fa fa-sign-out"/>
                                          </span>
                                              <span>Logout</span>
                                          </button>
                                        </form>
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