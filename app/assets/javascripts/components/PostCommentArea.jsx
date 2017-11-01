class PostCommentArea extends React.Component {
    render (){
        return(
        <article className="media" style={{marginLeft: '30px'}}>
            <div className="media-content">
                <div className="field">
                    <p className="control">
                        <textarea className="textarea" placeholder="Add a comment..." defaultValue={""} />
                    </p>
                </div>
                <div className="field">
                    <p className="control">
                        <button className="button">Post comment</button>
                    </p>
                </div>
            </div>

        </article>
        )
    }
}