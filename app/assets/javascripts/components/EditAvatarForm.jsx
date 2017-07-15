class EditAvatarForm extends React.Component {

constructor(props) {
  super(props)
  this.state = {
    avatarUrl: ''
  }
}
 
  render() {
    return (
      <div className="avatar">
        <form encType="multipart/form-data">
          <label htmlFor="avatarUrl">Avatar</label>
          <input name='avatarUrl' type="file" value={this.state.avatarUrl} onChange={this.props.handleAvatarSelect}/>
        </form>
      </div>
    )
  }
}