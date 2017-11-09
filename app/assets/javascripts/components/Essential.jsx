class Essential extends React.Component {

  constructor(){
    super();
    this.state = { locked: false }
  }

  lock(){
    this.setState({locked: true})
  }

  render(){

    var t = setTimeout(()=>{
      this.lock()
    }, 60000);

    window.onmousemove = () => {
      clearTimeout(t);

      t = setTimeout(()=>{
        this.lock()
      }, 60000);
    };

    {
      if(this.state.locked === true){
        return <Lockscreen user={this.props.user}></Lockscreen>
      }
    }

    return(
      <div className="columns" style={{ paddingTop: "60px"}}>
        <div className="column is-2 is-hidden-mobile">
          <Filter filter={this.props.filter}></Filter>
          <hr></hr>
          <Tags tags={this.props.tags}></Tags>
        </div>
        <div className="column is-8">
          <div className="box" style={{padding: "15px", minHeight: "100vh"}}>
            <Newsfeed></Newsfeed>
          </div>
        </div>
      </div>
    )
  }


}