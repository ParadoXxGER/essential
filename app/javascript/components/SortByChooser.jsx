import React from 'react'

export default class SortByChooser extends React.Component {

  render(){
    return(
        <div>
          <div className="field">
            <h2 className="subtitle">Sort by:</h2>
            <div className="control is-expanded">
              <div className="select is-fullwidth">
                <select>
                  <option>Date</option>
                  <option>Tag</option>
                  <option>People</option>
                </select>
              </div>
            </div>
          </div>
        </div>
    )
  }

}