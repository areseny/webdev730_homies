import React, { Component } from 'react'

class CircleContainer extends Component {

  constructor(props) {
    super(props)
    this.state = {
      LoopArticles: []
    }
  }


  render() {
    return (
      <div>
        <button className="btn btn-danger">
        Circles!
        </button>
      </div>
    )
  }
}

export default CircleContainer