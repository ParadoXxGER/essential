class Newsfeed extends React.Component {

    constructor(props) {
        super(props);
        this.state = { items: [], loading: true, showNewPostArea: false };
        this.toggleNewPostArea = this.toggleNewPostArea.bind(this);
    }

    mountResult(state){
      this.setState(state);
    }

    toggleNewPostArea(){
      this.setState({ showNewPostArea: !this.state.showNewPostArea });
    }

    componentDidMount() {
        fetch('/api/v1/newsfeed'+window.location.search)
        .then(response => response.json())
        .then(json => {
          this.mountResult({ items: json, loading: false})
        })
        .catch(error => {
            console.log(error)
        })
    }

    render() {

        if(this.state.loading){
            return <LoadingSpinner></LoadingSpinner>
        }

        return (
            <span>
              <NewsfeedNavigation toggleNewPostArea={this.toggleNewPostArea}/>
              <hr>

              </hr>
              {
                this.state.showNewPostArea === true &&
                <PostChooser/>
              }

              {
                this.state.showNewPostArea === true && <hr/>
              }

              {
                  this.state.items.map(item => {
                      return (
                          <PostListItem obj={item} key={item.id} />
                      )
                  })
              }

              <p className="has-text-centered">
                  <a> load more </a>
              </p>
            </span>
        )
    }
}