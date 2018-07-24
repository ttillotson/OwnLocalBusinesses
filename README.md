# OwnLocal Business' API

OwnLocal Business API is an RESTful API built with Ruby on Rails that serves
business information in a page format.

## Setup

### Prerequisites

This project utilizes:

- `Ruby` v 2.5.0
- `Ruby on Rails` v 5.2.0

### Install

To get started please:

- Click `Clone or download`
- Download the ZIP or clone the repo
    - Unzip the file and launch in your preferred text editor.
    - Navigate to the folder in your Terminal and execute `bundle install` in the command line.
- Clone the Repo
    - Launch in your preferred text editor and execute `bundle install` in the command line.
- Set up the database:
    - execute `rake db:setup` in the command line.
- Launch your Rails Server by typing `rails server` in the command line & going to `https://localhost:3000/`

## Using the API Endpoints

This project features 2 API endpoints:

- `index`: HTTP `GET` request that displays a slice of the total available businesses based on the passed `page` and `per_page` parameters; defaults 1 & 50 respectively.
    - `localhost:3000/businesses?page=1&per_page=50`

![index_demo](https://user-images.githubusercontent.com/29738420/43109553-335ef748-8e9c-11e8-9662-4fed90936103.gif)

- `show`: HTTP `GET` request that displays a given business' held information from the database

## Future Directions

### Next Best Selection

While handling errors is an important part of the project, it may be reasonable to always pass the closest possible data that fits a given window. To meet that end, additional methods have been included in the controller that will always pull the closest valid page to a given parameter.

### Authentication for Requests

While these are API endpoints are great for demonstrative purposes, it may be important down the line to validate all requests and handle the requests accordingly. In light of this, there is an attached validation that can be configured in the top of the controller.

## Notes and Considerations

### Namespace

This endpoints are designed to run on the standard model namespace. If we needed to preserve it for any reason, we could nest the routes under an api namespace and then nest the controller file as well:

```ruby
    # Routes

    Rails.application.routes.draw do
        namespace :api, defaults: { format: :json } do 
            resources :businesses, defaults: { format: :json }, only: %i(index show)
        end
    end

    # Controller
    class Api::BusinessesController < ApplicationController
```