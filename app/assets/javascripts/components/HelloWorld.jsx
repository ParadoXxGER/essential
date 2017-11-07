class HelloWorld extends React.Component {
    render() {
        return (
            <span>

              <p>
                <h1 className="title">{this.props.title}</h1>
                Filter:
              </p>
              <div className="tags">
                <div class="field is-grouped is-grouped-multiline">
                  {
                    this.props.filter.map(filter => { return (
                        <div class="control">
                          <div class="tags has-addons">
                            <a class="tag is-link">{filter}</a>
                            <a class="tag is-delete"></a>
                          </div>
                        </div>
                    )})
                  }
                </div>
              </div>
              <p>Tags:</p>
                <div class="field is-grouped is-grouped-multiline">
                  {
                    this.props.tags.map(tag => { return (
                        <div class="control">
                          <div class="tags has-addons">
                            <a class="tag is-link">{tag}</a>
                            <a class="tag is-delete"></a>
                          </div>
                        </div>
                    )})
                  }
                </div>
            </span>
        )
    }
}