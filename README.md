# MyStore

You need the following installed:
* Ruby >= 3.3.0 (`asdf install`)
* Bundler (`gem install bundler`)
* Node 19 (`asdf install`)
* Yarn (`npm install yarn --global`)
* Overmind (`brew install tmux overmind`)
* Postgresql (`brew install postgresql@16` start with: `brew services start postgresql@16`)
* Redis (`brew install redis` start with: `brew services start redis`)

If you are using [asdf](https://asdf-vm.com/) (I recommend that you do :) ) you can install the required Ruby and NodeJS versions with `asdf install`

The Homebrew dependencies can be installed with running:

```bash
brew bundle install --no-upgrade
```

## Getting started
### Initial application setup

Run the setup script that will run the needed setup steps for the application, installing all gems and packages, database preparing etc.

```sh
bin/setup
```

### Development

Will run [Overmind](https://github.com/DarthSim/overmind) (or Foreman if Overmind is not installed), starts the build for all assets automaticly and will start the rails server.

```sh
bin/dev
```

## Code Guidelines

It uses [Rails Omakase RuboCop](https://github.com/rails/rubocop-rails-omakase) for Ruby to automatically fix code style offenses.

```sh
bin/rubocop
```

to automatically format Ruby with Rubocop you can run:

```sh
bin/rubocop -a
```
