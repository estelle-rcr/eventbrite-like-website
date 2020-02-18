# README

This app is made as part of the bootcamp The Hacking Project. 
It aims at creating a basic version of a Eventbrite-like website in Ruby on Rails and using Bootstrap to set up quickly the design. The website has been made in full respect of MVC's architecture and CRUD principles. 'Fat models, skinny controllers' have been respected as much as I could ;)

The website is live on Heroku, please check: 
https://side-events.herokuapp.com/


## The Ruby version 
The ruby version used is 2.5.1.
The rails version used is volontarily 5.2.3.

## Install from your console

`git clone https://github.com/estelle-rcr/event-bg.git`
  `cd event-bg`

Install the bundle:
  `bundle install`
  
Set up the database:
  `rails db:create`
      `rails db:migrate`
  
Seed the database:
  `rails db:seed`

Finally launch the server:
  `rails server`

And then access the localhost accordingly, for instance:
  `http://localhost:3000/`


## Additional Gems used
We have used some additional Gems such as:

Faker gem for generating random data

bcrypt for encryption of the passwords


## Start playing around with the database in the sandbox:
To use, please follow these commands:
`rails console --sandbox`

The tables in the database are:
- users (that can be called as 'admin' of events)
- events
- attendances (user + event)

The tables tags and likes are operational but the related features are not implemented in front.

### Run tests yourself:

* The database has been seeded to enable testing. To do that, first launch your rails console from your terminal in test environment, so that nothing will be saved:

`rails console --sandbox`

* You can try various method using the class from the tables :

`@gossips = Gossip.all`
  `gossips.author`

* Visit the URLs:
  `http://localhost:3000/`
    `http://localhost:3000/event/1`
      `http://localhost:3000/user/1`

 * Features to be tested:
 - sign up as a user (with secured password using 'devise' gem)
 - log in as a user
 - secured accounts with 'devise'
 - log out (+ cookies deletion)
 - consult events
 - create an event (only if you're logged in)
 - edit and delete you're the admin of the events
