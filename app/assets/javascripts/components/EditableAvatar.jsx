class EditableAvatar extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      avatarUrl: this.props.profile && this.props.profile.avatar_url || this.props.defaultUrl,
      isEditing: false,
    }

    this.handleChangeClick  = this.handleChangeClick.bind(this)
    this.handleAvatarChange = this.handleAvatarChange.bind(this)
    this.handleAvatarSave   = this.handleAvatarSave.bind(this)

  }

  handleChangeClick() {
    this.setState({
      isEditing: true
    })
  }

  handleAvatarChange(e) {
    this.setState({avatarUrl: e.target.value})
  }

  handleAvatarSave() {
    if(!this.validateImage(this.state.avatarUrl)) {
      this.setState({errors: ['The image url needs to be a valid image']})
      return
    }

    var xhr = $.ajax({
      url: `/profiles/${this.props.profile.id}.json`,
      type: 'PATCH',
      data: { profile: { avatar_url: this.cleanUrl(this.state.avatarUrl) } }
    })

    xhr.done( () => {
      console.log(`server ok`)
      this.setState({avatarUrl: this.cleanUrl(this.state.avatarUrl), isEditing: false})
      
    })

    xhr.fail( () => {
      console.log(`server fail`)
      this.setState({errors: ['There was a server problem, please email support']})
    })
  }

  cleanUrl(url) {
    return url.toLowerCase().replace('https:','').replace('http:','')
  }

  validateImage(url) {
    return url.indexOf('.jpg')  > -1 ||
           url.indexOf('.jpeg') > -1 ||
           url.indexOf('.png')  > -1 ||
           url.indexOf('.gif')  > -1
  }
  

  render() {
    return (
      <div className="avatar">
      { this.state.isEditing
        ? (<EditAvatarForm
            errors={this.state.errors}
            handleAvatarChange={this.handleAvatarChange}
            handleAvatarSave={this.handleAvatarSave}
          />)
        : <div>
          <img src={this.state.avatarUrl} className="img-responsive" />
          <button type="button" onClick={this.handleChangeClick}>change</button>
          </div>
      }
      </div>
    )
  }
}