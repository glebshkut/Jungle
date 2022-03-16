# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots
### Log In
![Log In](https://github.com/glebshkut/Jungle/blob/master/docs/login.png?raw=true)
### Products
![Products](https://github.com/glebshkut/Jungle/blob/master/docs/products.png?raw=true)
![Category filter](https://github.com/glebshkut/Jungle/blob/master/docs/category.png?raw=true)
![Cart](https://github.com/glebshkut/Jungle/blob/master/docs/cart.png?raw=true)
![Payment](https://github.com/glebshkut/Jungle/blob/master/docs/payment.png?raw=true)
![Order confirmation](https://github.com/glebshkut/Jungle/blob/master/docs/order_info.png?raw=true)
![About this Shop](https://github.com/glebshkut/Jungle/blob/master/docs/about_shop.png?raw=true)

Image Name  | Image
------------- | -------------
Log In  | https://github.com/glebshkut/Jungle/blob/master/docs/login.png?raw=true
Products  | https://github.com/glebshkut/Jungle/blob/master/docs/products.png?raw=true
Category filter | https://github.com/glebshkut/Jungle/blob/master/docs/category.png?raw=true
Cart | https://github.com/glebshkut/Jungle/blob/master/docs/cart.png?raw=true
Payment | https://github.com/glebshkut/Jungle/blob/master/docs/payment.png?raw=true
Order confirmation | https://github.com/glebshkut/Jungle/blob/master/docs/order_info.png?raw=true
About this Shop | https://github.com/glebshkut/Jungle/blob/master/docs/about_shop.png?raw=true
Have fun with our shop! 😂

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
