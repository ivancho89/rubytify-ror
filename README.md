# Rubytify

Becuase of the gem file, i recommend you tu use rvm and use ruby-2.6.2 to avoid issues when you are running bundle install.
If you have any trubles with the bundle install, try removing the Gemfile.lock file and running the bundle again.

## Instructions

- Run migrations   `bundle exec rake db:migrate`
- Run the spority pull process `bundle exec rake db:spotify_data`
    - Check in the console if evrything went well or if something is crashing

# Run Local

- Run `rails server`

## Missing

- Upload to cloud
- Unit tests
- Linter or similar for ruby

## To Improve 

- Create a better way to load spotify info into the DB
- Find a better way to get artist from Spotify to avoid multple calls and just make one



