class HelloWorld extends React.Component {
    render() {
        return (
            <span>
              <h1 className="title">{this.props.title}</h1>
              <p>
                Filter:
              </p>
              <div className="tags">
                <div className="field is-grouped is-grouped-multiline">
                  {
                    this.props.filter.map(filter => { return (
                        <div className="control" key={filter}>
                          <div className="tags has-addons">
                            <a className="tag is-link">{filter}</a>
                            <a className="tag is-delete"></a>
                          </div>
                        </div>
                    )})
                  }
                </div>
              </div>
              <p>Tags:</p>
                <div className="field is-grouped is-grouped-multiline">
                  {
                    this.props.tags.map(tag => { return (
                        <div className="control" key={tag}>
                          <div className="tags has-addons">
                            <a className="tag is-link">{tag}</a>
                            <a className="tag is-delete"></a>
                          </div>
                        </div>
                    )})
                  }
                </div>
            </span>
        )
    }
}