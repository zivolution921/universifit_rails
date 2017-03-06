# Be sure to restart your server when you modify this file.


# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( homepage.css front_end.css front_end.js front_end_bottom.js)
Rails.application.config.assets.paths << "vendor/assets/fonts/"
