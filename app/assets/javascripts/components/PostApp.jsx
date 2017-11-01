class PostApp extends React.Component {

    constructor(props) {
        super(props);
        this.myArray = [1,2,3,4,5,6,7,8,9,10];
    }

    addPost(){
        this.myArray.push(this.myArray.length)
    }

    render() {

        return (
            <span>
                {
                    this.myArray.map(i => {
                        return (
                            <PostListItem key={i} />
                        )
                    })
                }
                <p className="has-text-centered">
                    <a onClick = {this.addPost}> load more </a>
                </p>
            </span>
        )
    }
}