import React, {Component} from 'react';
import CommentComponent from './CommentComponent.jsx'


class CommentsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      url: props.url,
      comments: props.comments
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({url: nextProps.url, comments: nextProps.comments})
  }

  render() {

    return(
      <div className="article-commnet">
      { this.state.comments.map((comment, index) => {

        return  <CommentComponent
                    user_id={ comment.user_id }
                    content={ comment.content }
                    key={index}
                />
      }) }
      </div>
    )
  }
}

export default CommentsContainer;

