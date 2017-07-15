class EditableAvatar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      imageUrl: this.props.profile && this.props.profile.avatar_url || this.props.defaultUrl,
      isEditing: false,
    }

    this.handleChangeClick = this.handleChangeClick.bind(this)
    this.handleAvatarSelect = this.handleAvatarSelect.bind(this)
  }

  handleChangeClick() {
    this.setState({
      isEditing: true
    })
  }

  handleAvatarSelect(e) {
    

    const data = new FormData()
    data.append('fileInput', e.target.value)
    data.append('formData', this.props.presignedPost)
    console.log(this.props.presignedPost)


// we need to use the s3 sdk to get  the url encoded with the proper values.
    let xhr = axios.post(this.props.presignedPost.url, data)
    .then( response => {
      console.log(response)
    })
    //xhr.success( (resp) => {
    //  this.setState({ image:url resp.data.avatarUrl }),
    //  isEditing: false,
    //})
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