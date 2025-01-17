# README

# [Flexcar-Market](https://flexcar-market-app-8abf6aa694c6.herokuapp.com/)

## Introduction

Flexcar-Market is a small RoR app for a market that can create products, promotions, and most importantly Carts for customers.

The basics:
- [Ruby 3.2.1](https://www.ruby-lang.org/en/news/2023/02/08/ruby-3-2-1-released/)
- [Rails 8.0.0](https://guides.rubyonrails.org/8_0_release_notes.html)
- [Postgres](https://www.postgresql.org/)
- [Tailwind](https://tailwindcss.com/)
- [StimulusJS](https://github.com/hotwired/stimulus) ([reference](https://stimulus.hotwired.dev/))
- [Turbo](https://github.com/hotwired/turbo-rails) ([reference](https://turbo.hotwired.dev/))
- [RSpec](https://rspec.info/) with [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) and [FactoryBot] (https://github.com/thoughtbot/factory_bot_rails)

## How does it work?

Flexcar-Market is backed by 5 models. The app has five main pages:
 - welcome#index: a static page with some text acting as a CTA
 - products#new: You can make products to add to a cart later
 - promotions#new: You can make promotions that are attached to certain products or categories here
 - carts#new: You can make a new cart that you can add cart items to to make a checkout
 - carts#checkout: The is the final page that will show the use the final price of all the products + promotions in the cart

Here's a video highlighting how one can use the app:

https://ooo.mmhmm.app/watch/z_vY1itcCUGRmREkZh63we


## Extras

 - added indexes in quite a few places to speed up results
 - added an ApplicationController rescue_from to gracefully handle all missing records and invalid record saves
 - added some stimulus for a a smooth UX
 - deployed to heroku and accessible here: https://flexcar-market-app-8abf6aa694c6.herokuapp.com/
 - quick tailwind CSS formatting to make the site easier to navigate
 - thoughtful DB validations


## Didn't do
 - I need more specs, but given this is an exercise I focused on the most important ones
 - Index route formatting - it was outside of the requirements but I felt the page was helpful so I left it
 - But X get Y is called bogo discounts for brevity and need to be entered a little differently, here's an example: https://ooo.mmhmm.app/watch/z_yYnleouOgFeQG6raxrqm
 - Buy X Get Y on categories will use the cheapest item to populate the discount


## Setup

After cloning the repo and ensuring you have the appropriate Ruby and Rails versions:
 - `bundle install`
 - Database creation: `bundle exec rails db:create`
- Database initialization: `bundle exec rails db:seed`
- Database migration:`bundle exec rails db:migrate`
- `rails s`
- visit http://localhost:3000/

## Tests

I've added a good amount of model specs and controller specs.

Run both with:

```
bundle exec rspec
```