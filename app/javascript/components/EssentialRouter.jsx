import React from 'react'
import { BrowserRouter, Route, Link, Switch } from 'react-router-dom'
import Essential from './Essential'
import Navigation from "./Navigation";

export default class EssentialRouter extends React.Component {

  render(){
    return (
        <BrowserRouter>
          <Switch>
            <Route path="/newsfeed">
              <Essential user={this.props.user} tags={this.props.tags} filter={this.props.filter}></Essential>
            </Route>
            <Route path="/pages">
              <Navigation/>
            </Route>
          </Switch>
        </BrowserRouter>
    )
  }
}