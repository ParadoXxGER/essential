import React from 'react'
import LoadingSpinner from './LoadingSpinner'
import NewsfeedNavigation from './NewsfeedNavigation'
import PostListItem from './PostListItem'
import PostNew from "./PostNew";

export default class Newsfeed extends React.Component {

    constructor(props) {
        super(props);
        this.state = { items: [], loading: true, showNewPostArea: false };
        this.toggleNewPostArea = this.toggleNewPostArea.bind(this);
        this.getPosts = this.getPosts.bind(this);
        this.mountState = this.mountState.bind(this);
        this.showLoadingSpinner = this.showLoadingSpinner.bind(this);
    }

    mountState(state){
      this.setState(state);
    }

    toggleNewPostArea(){
      this.setState({ showNewPostArea: !this.state.showNewPostArea });
    }

    componentDidMount() {
      this.getPosts()
    }

    showLoadingSpinner() {
      this.mountState({ items: [], loading: true})
    }

    getPosts(){
      fetch('/api/v1/newsfeed'+window.location.search)
          .then(response => response.json())
          .then(json => {
            this.mountState({ items: json, loading: false})
          })
          .catch(error => {
            console.log(error)
          })
    }

    render() {

        if(this.state.loading){
            return <LoadingSpinner></LoadingSpinner>
        }

        return (
            <span>
              <NewsfeedNavigation toggleNewPostArea={this.toggleNewPostArea}/>
              <hr>

              </hr>
              {
                this.state.showNewPostArea === true &&
                <PostNew showLoadingSpinner={this.showLoadingSpinner}  getPosts={this.getPosts} toggleNewPostArea={this.toggleNewPostArea}/>
              }

              {
                this.state.showNewPostArea === true && <hr/>
              }

              {
                  this.state.items.map(item => {
                      return (
                          <PostListItem obj={item} key={item.id+""+item.type} />
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