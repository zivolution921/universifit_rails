class EditAvatarForm extends React.Component {

 
  render() {
    return (
      <div className="avatar">
        <form encType="multipart/form-data">
          <label htmlFor="avatarUrl">Avatar</label>
          <input name='avatarUrl' type="file" onChange={this.props.handleAvatarSelect}/>
        </form>
      </div>
    )
  }
}