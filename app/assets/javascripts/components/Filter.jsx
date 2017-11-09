class Filter extends React.Component {
  render(){
    return (
      <div>
        <h2 className="subtitle">Filter: </h2>
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
    )
  }
}