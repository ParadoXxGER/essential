class PostApp extends React.Component {

    constructor(props) {
        super(props);
        this.state = { items: [], loading: true };
    }

    mountResult(state){
      setTimeout(() => {
        this.setState(state);
      }, 1000)
    }

    componentDidMount() {
        fetch('/api/v1/text_posts')
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