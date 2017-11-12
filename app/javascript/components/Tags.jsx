import React from 'react'

export default class Tags extends React.Component {
  render(){
    return (
        <div>
          <h2 className="subtitle">Tags: </h2>
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
        </div>
    )
  }
}