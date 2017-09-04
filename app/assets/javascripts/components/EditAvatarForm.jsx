class EditAvatarForm extends React.Component {

  render() {
    return (
      <div className="avatar">
        <p>We do not host images. Please upload your avatar to&nbsp;
        <a href="https://postimg.org" target="_blank">postimg.org</a> and paste the 'direct' url here.</p>
        <label htmlFor="avatarUrl">Avatar url:</label><br />
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