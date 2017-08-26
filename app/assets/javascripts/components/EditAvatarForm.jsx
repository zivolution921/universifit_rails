class EditAvatarForm extends React.Component {

  render() {
    return (
      <div className="avatar">
      <label htmlFor="avatarUrl">Avatar</label>
      <input id='avatarUrl' name='avatarUrl' type="text"
        value={this.props.avatarUrl}
        onChange={this.props.handleAvatarChange}/>
      {this.props.errors 
        ? <div>{this.props.errors}</div>
        : null
      }
      <button onClick={this.props.handleAvatarSave}>Save</button>
      </div>
      )
  }
}