# LiveWire

Third Flatiron Project for Software Engineering Path.
LiveWire App offers semi-social media features, such as adding friends, posting posts and commenting posts.

### Top Gems
These are the top major gems that support the LiveWire features.
1. acts_as_commentable_with_threading
2. auto_html
3. bulma-extensions-rails
4. bulma-rails
5. devise
6. geocoder
7. has_friendship
8. link_thumbnailer
9. open-weather
10. pagy
11. routes_coverage
12. rubocop
13. rubycritic

## Poject Requirements
* Ruby 2.7.1p83
* Rails 6.0.3.4
* SQLite version 3.31.1


## Installation
To install and use LiveWire app, clone the app repository.

```bash
git clone https://github.com/johncban/livewire.git
cd livewire
```
Inside the project folder, install the gems.
```bash
bundle install
```

## Usage
To use the app, while inside the project folder it will need to migrate the database for table creation then seed the users table for user values.
```bash
rails db:migrate
rails db:seed
```
Then run the app by starting the server.
```bash
rails s
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)