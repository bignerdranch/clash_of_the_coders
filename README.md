# Clash of the Coders

I think this app is fairly straightforward.  I'm trying to minimize
dependencies as far as possible, at least at first.

## Bootstrapping

1. Make sure you have the basics installed:
   * Ruby 2.0.0
   * Postgresql
1. Run `bundle install`.
1. Set up a [new Stable OAuth Application](https://stable.bignerdranch.com/oauth/applications)
   * Add a `callback_url` of `http://localhost:5000/auth/stable/callback`
   * Copy the _Application ID_ to your `.env` file's `STABLE_KEY`
   * Copy the _Secret_ to your `.env` file's `STABLE_SECRET`
1. Add your personal Stable API Key to your `.env` file's `STABLE_API_KEY`.
1. Bootstrap your database by running `bin/bootstrap-database`.
1. Run the app via `foreman start`
   * NOTE: You must run the app on the same port you specified in the Stable
     OAuth callback, above.

## Contributing

Please do. Ask if you need anything.

