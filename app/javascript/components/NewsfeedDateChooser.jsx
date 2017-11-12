import React from 'react';

export default class NewsfeedDateChooser extends React.Component {

  render(){
    return(
        <div>
          <div className="field">
            <h2 className="subtitle">From:</h2>
            <div class="control is-expanded">
              <div class="select is-fullwidth">
                <select>
                  <option>2017-11-01</option>
                </select>
              </div>
            </div>
          </div>
          <div className="field">
            <h2 className="subtitle">To:</h2>
            <div class="control">
              <div class="select is-fullwidth">
                <select>
                  <option>2017-11-02</option>
                </select>
              </div>
            </div>
          </div>
        </div>
    )
  }
}