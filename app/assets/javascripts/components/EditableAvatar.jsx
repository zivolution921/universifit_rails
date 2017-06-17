class EditableAvatar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      imageUrl: this.props.profile && this.props.profile.avatar_url || this.props.defaultUrl,
      isEditing: false,
    }

    this.handleChangeClick = this.handleChangeClick.bind(this)
  }

  handleChangeClick() {
    this.setState({
      isEditing: true
    })
  }

  handleAvatarSelect() {
    console.log('Hell yeah')
    let xhr = aios.someCallHereToS3
    xhr.success( (resp) => {
      this.setState({ image:url resp.data.avatarUrl }),
      isEditing: false,
    })
  }


  render() {
    return (
      <div className="avatar">
      { this.state.isEditing
        ? <EditAvatarForm handleAvatarSelect={this.handleAvatarSelect}/>
        : <div>
          <img src={this.state.imageUrl} className="img-responsive" />
          <button type="button" onClick={this.handleChangeClick}>change</button>
          </div>
      }
      </div>
    )
  }
}