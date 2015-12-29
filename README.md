# Fake Shopify

Testbed for Shopify Apps (embedded admin pages and proxies), Themes and Webhooks.

## FAQ

**Q:** Can I make a real Shopify with this?<br>
**A:** No, don't be silly, this is just for faking.

## Getting the code

First things first, you need the repository:

    git clone git://github.com/jeffrafter/fake_shopify.git

Once you have that you'll want to switch to that folder. This project was built using
Rails 4.2.x and Ruby 2.1.x Ruby versions are managed with rbenv and when switching to
the folder you should receive a notice that you need to install ruby if it is missing.

Once you have the code you should be able to bundle.

## That placeholder font

We use a really great placeholder font called [Blokk](http://blokkfont.com).

## Environment

Make a `.env` file:

    RACK_ENV=development
    PORT=3000
    DOMAIN=myshopify.dev

## Mail

You need to send mails locally, to do this use `mailcatcher`:

    gem install mailcatcher

Then run it:

   mailcatcher

Once you have sent mails you can view them at [http://localhost:1080](http://localhost:1080)

## Database

The database requires you to use postgres in development. Assuming you have this you should be able to migrate

    bundle exec rake db:create db:migrate

For tests:

    bundle exec rake RAILS_ENV=test db:create db:migrate

For seeding:

    foreman run bundle exec rake db:seed


## Running locally

To start the app locally you'll want to use foreman:

    foreman start

## Fixtures

We don't want to recreate all of Shopify. Shopify already did a great job of that. Instead we want to allow you to quickly replicate the behavior of Shopify from an API, theme, and app perspective. To do this we utilize fixtures. This project comes with a default set of fixtures for a sample store but you can download your own information and save them as fixtures as well.

## Themes

Shopify utilizes the liquid templating language for it’s theme engine. We try to use the same engine and  provide the same features.

## Webhooks

Triggering webhooks

## Proxies

Registering your proxy

## Embeds


## Specs

Testing is done using RSpec. You can run this continuously using Guard:

    bundle exec guard


