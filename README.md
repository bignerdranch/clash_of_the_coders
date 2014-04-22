# Clash of the Coders

I think this app is fairly straightforward.  I'm trying to minimize
dependencies as far as possible, at least at first.

## Bootstrapping

1. Make sure you have the basics installed:
   * Ruby 2.0.0
   * Postgresql
2. Run `bundle install`.
3. Grab a copy of `.env` from [credentials][credentials] and place it
   in the application root directory.
4. Bootstrap your database by running bin/bootstrap-database.
5. Run the app on port 3000 (for oauth to work you have to run it on
   this port).  The easy way to do this is `bin/rails s`.

## Contributing

Please do.  Ask if you need anything.

[credentials]:https://github.com/bignerdranch/credentials/blob/master/clash_of_the_coders/.env
