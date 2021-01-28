# MIM-API

### Medicine Inventory Manager (MIM)

A simple inventory program for managing repeat prescriptions. Add a new prescription to MIM's database and make it active, it should appear in the user's inventory.

Current development focus is on the test suite.

## Environment 

* macOS 11.1
* ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-darwin20]
* Rails 6.1.1

## Setup

`$ git clone "https://github.com/nickstewart/mim.git"`

`$ cd mim`

`$ bin/bundle install`

`$ bin/rails db:migrate`

`$ bin/rails server`

`$ bin/rails test:all`

