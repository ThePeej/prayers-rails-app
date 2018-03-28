# Prayers
#### A Sinatra Portfolio Project for Flatiron School
---

The project is a simple CRUD app that allows a user to create, read, update, and destroy prayers posted on the app. Users are able to create groups and comment on prayers and groups. Users can also peruse a collection of prayers found throughout the Bible. 

## Functionality Overview:
	- User will have many groups, and many prayers.
		- User can sign up for, log into, edit, and delete his or her account.
		- User can create, edit, and delete groups.
		- User can create, edit, and delete prayers
	- Groups will have one leader, many members, many prayers through members.
		- Only specific prayers posted to each group will be visible from group's page.
		- Only non-private groups will be displayed on the group index page.
		- Users cannot manually join a private group
	- Prayers will belong to a memember, and will have many groups.
		- Prayers can be posted anonymously
		- Prayers can be posted only to specific groups that the user is part of.
		- Prayers can be posted to the "public" prayers index page.
  - Comments will belong to user (commenter) and prayer (commented prayer)
    - Comments must contain content
    - New comments are entered via the prayer show page
	- Bible prayers are loaded dynamically as you navigate forward and backward
	- Group comments are posted dynamically without a page refresh
	- Prayer comments are displayed and hidden dynamically



Built using HTML, CSS, Javascript, jquery, Ruby on Rails, and  Bulma CSS framework


## Installation Instructions

Fork/Clone this repo, and then navigate to the repo directory in your terminal.

Then, run `bundle install` to install all gem dependencies.

Run all rake migrations with `rake db:migrate`

Finally, start up a `rails server` and navigate to the provided url


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ThePeej/prayers-rails-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CatBreeds project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ThePeej/prayers-rails-app/blob/master/LICENSE).