# DismissibleBlocks

## Overview
**DismissibleBlocks** is a Ruby on Rails engine that allows for dismissible blocks of HTML code whose state is saved in the database per user.


## Installation
### Requirements
The DismissibleBlocks gem has the following requirements:

- [Ruby on Rails](http://rubyonrails.org/) 3.2 or above
- [jQuery](http://jquery.com/)

### Gemfile
Add the following line to your application's Gemfile:

    gem 'dismissible_blocks'

And then execute:

    $ bundle install

### Manual Installation
Install it yourself:

    $ gem install dismissible_blocks


## Usage
### Routes
DismissibleBlocks automatically adds the required routes when the gem is added to your project.

### Views
Adding dismissible blocks of HTML code is very easy. DismissibleBlocks does not generate any extra HTML and therefore gives you complete control over your code.

To add a dismissible block to a view, use the `render_dismissible_block` helper method. This will create a dismissible block named `lorem`:

	<%= render_dismissible_block 'lorem' do %>
	  ...
	<% end %>

This alone isn't enough, you need to identify the container and button HTML. This is done using HTML5 `data-` attributes. There are two attributes that you must add to the HTML to make everything work as expected:

1. `data-dismissible`: attribute for the container of the HTML block.
2. `data-dismissible-hide`: attribute for the button to hide the HTML block.

For example:

	<%= render_dismissible_block 'lorem' do %>
	  <div data-dismissible>
	    <p>...</p>
	    <a href="#" data-dismissible-hide>Hide</a>
	  </div>
	<% end %>

Also make sure the [Cross-Site Request Forgery](http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf) (CSRF) token is included in your layout:

	<%= csrf_meta_tags %>

### JavaScript
Add the following JavaScript to `app/assets/javascripts/application.js`.

In its simplest form, you can require all the needed JavaScript using:

	//= require jquery
	//= require dismissible_blocks
	//= require dismissible_blocks_loader

If you want to customize how a block of HTML is hidden using — for example — a slide up effect, you can customize the JavaScript like so:

	//= require jquery
	//= require dismissible_blocks
	
	$(document).ready(function() {
	  $('[data-dismissible]').dismissible({
	    dismiss: function(helper) {
	      helper.slideUp();
	    }
	  });
	});

### Model

DismissibleBlocks saves the dismissed blocks on a model. It uses the `current_user` helper method to access the current user/account.

The model must have an attributed named `dismissed_blocks` and be of type Array.

#### ActiveRecord
ActiveRecord's serialization feature can achieve this. First, create a database migration to add the required field:

	class AddDismissedBlocksToUsers < ActiveRecord::Migration
	  def up
	    add_column :users, :dismissed_blocks, :text
	  end
	
	  def down
	    remove_column :users, :dismissed_blocks
	  end
	end

Then add the serialization to the model:

	class User < ActiveRecord::Base
	  serialize :dismissed_blocks, Array
	end

#### ActiveRecord (using PostgreSQL)
If you are using [PostgreSQL](http://www.postgresql.org/) with native array support using [PostgresExt](https://github.com/dockyard/postgres_ext), your database migration would simply be:

	class AddDismissedBlocksToUsers < ActiveRecord::Migration
	  def up
	    add_column :users, :dismissed_blocks, :string, :array => true
	  end
	
	  def down
	    remove_column :users, :dismissed_blocks
	  end
	end

#### Mongoid
To add MongoDB support using [Mongoid](mongoid.org), add this to the user/account model:

	field :dismissed_blocks, type: Array, default: []

#### Helper Method Not `current_user`
By default, DismissibleBlocks saves the state to the database using the `current_user` helper method. If your user/account helper method is named something else — for example `current_employee`:

	def current_employee
	  ...
	end
    helper_method :current_employee

Use `alias_method` to create an alias to your helper method; don't forget to also include `helper_method` to make your helper available from your views:

	alias_method :current_user, :current_employee
    helper_method :current_user

## Author
[Patrick Bougie](http://patrickbougie.com/)


## Contributing

1. Fork DismissibleBlocks: `https://github.com/pbougie/dismissible_blocks`
2. Create your feature branch: `git checkout -b new-feature`
3. Commit your changes: `git commit -am 'New feature description'`
4. Push to the branch: `git push origin new-feature`
5. Create a new Pull Request on [GitHub](https://github.com/)


## Legal
DismissibleBlocks is copyright © 2014 [Patrick Bougie](http://patrickbougie.com/). It is free software and may be redistributed under the terms specified in the LICENSE.text file.
