![LiveWire](https://rawcdn.githack.com/johncban/livewire/0806f62afecf3b3f9da856120a37849f6e968e3a/app/assets/images/logo/lw_logo.png)
Third Flatiron Project for Software Engineering Path.
LiveWire App offers semi-social media features, such as adding friends, posting posts and commenting posts.

### Top Gems
These are the top major gems that support the LiveWire features.
1. [acts_as_commentable_with_threading](https://github.com/elight/acts_as_commentable_with_threading)
2. [auto_html](https://github.com/dejan/auto_html)
3. [bulma-extensions-rails](https://github.com/dhmgroup/bulma-extensions-rails)
4. [bulma-rails](https://github.com/joshuajansen/bulma-rails)
5. [devise](https://github.com/heartcombo/devise)
6. [geocoder](https://github.com/alexreisner/geocoder)
7. [has_friendship](https://github.com/sungwoncho/has_friendship)
8. [link_thumbnailer](https://github.com/gottfrois/link_thumbnailer)
9. [open-weather](https://github.com/coderhs/ruby_open_weather_map)
10. [pagy](https://github.com/ddnexus/pagy)
11. [routes_coverage](https://github.com/Vasfed/routes_coverage)
12. [rubocop](https://github.com/rubocop-hq/rubocop)
13. [rubycritic](https://github.com/whitesmith/rubycritic)

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
To use the app, while inside the project folder it will need to migrate the database for table creation then seed the state and users table for values.
```bash
rails db:migrate
rails db:seed
```
Then run the app by starting the server.
```bash
rails s
```
### Screenshots
Login Screen and User Dashboard 
#### Login Screen
![Login](https://rawcdn.githack.com/johncban/livewire/0806f62afecf3b3f9da856120a37849f6e968e3a/app/assets/images/screenshots/login.png)

#### User Dashboard
![User Dashboard](https://rawcdn.githack.com/johncban/livewire/0806f62afecf3b3f9da856120a37849f6e968e3a/app/assets/images/screenshots/user_dashboard.png)

### Ruby Critic Report
Code Quality Score
![Code Quality Score](https://rawcdn.githack.com/johncban/livewire/d91694b4665ee3d6173efa3ae9984c547640c515/app/assets/images/screenshots/rubyCritic.png)  

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)