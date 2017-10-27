# config/initializers/geocoder.rb
Geocoder.configure(
  # geocoding service
  lookup: :google,

  # geocoding service request timeout (in seconds)
  timeout: 3,

  # default units
  units: :km,

  api_key: "AIzaSyBUXPU_VPiyY2rf6GZpGLgpNmNrf7lLxgg"
)
