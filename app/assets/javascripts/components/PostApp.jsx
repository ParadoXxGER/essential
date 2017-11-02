class PostApp extends React.Component {

    constructor(props) {
        super(props);
        this.state = { items: [] };
    }

    componentDidMount() {
        fetch(`/api/v1/text_posts`)
        .then(result=> {
            this.setState({items: this.state.items.concat(result.json())});
        })
        .catch(error => {
            console.log(error)
        })
    }

    render() {
        return (
            <span>

                {
                    this.state.items.map(item => {
                        return (
                            <PostListItem key={item.id} />
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