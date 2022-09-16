<h1 align="center">Tea Subscription</h1>

## Overview
This app creates an API for a tea subscription service. The endpoints created are:
An endpoint to subscribe a customer to a tea subscription.
An endpoint to cancel a customer’s tea subscription.
An endpoint to see all of a customer’s subsciptions (active and cancelled)

## Database
<img width="863" alt="Screen Shot 2022-09-15 at 8 00 59 PM" src="https://user-images.githubusercontent.com/92293363/190540273-99e80077-d562-4c8d-802b-de1654530cf5.png">

## Set Up
- `fork` then `git clone` this repository
- `cd tea_subsription` into the root directory
- `bundle install` to install dependencies
- `rails db:{create,migrate,seed}`
- `rails s` to start your server on `localhost:3000`

## Technologies
<p>
  <img src="https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/Ruby-CC0000.svg?&style=flaste&logo=ruby&logoColor=white" />
  <img src="https://img.shields.io/badge/ActiveRecord-CC0000.svg?&style=flaste&logo=rubyonrails&logoColor=white" />
  <img src="https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white" />  
  <img src="https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white" />
  </br>
  <img src="https://img.shields.io/badge/Postman-FF6E4F.svg?&style=flat&logo=postman&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1.svg?&style=flaste&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/rspec--rails-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />
  <img src="https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />  
  <img src="https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white" />   
  <img src="https://img.shields.io/badge/OOP-b81818.svg?&style=flaste&logo=OOP&logoColor=white" />
  <img src="https://img.shields.io/badge/TDD-b87818.svg?&style=flaste&logo=TDD&logoColor=white" />
  <img src="https://img.shields.io/badge/MVC-b8b018.svg?&style=flaste&logo=MVC&logoColor=white" />
  <img src="https://img.shields.io/badge/REST-33b818.svg?&style=flaste&logo=REST&logoColor=white" />  
</p>

## Endpoints
#### Request
`GET /api/v1/customers/:customer_id/subscriptions`
#### Response
```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Becks tea selection",
                "price": 9.89,
                "status": "cancelled",
                "frequency": "monthly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Becks tea selection",
                "price": 7.99,
                "status": "cancelled",
                "frequency": "monthly"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Becks tea selection",
                "price": 8.8,
                "status": "active",
                "frequency": "monthly"
            }
        }
    ]
}
```

#### Request
`POST /api/v1/customers/:customer_id/subscriptions`
##### Request Body
```json
    {
      "customer_id": 1,
      "tea_id": 1,
      "title": "new tea",
      "price": 5.99,
      "status": "active",
      "frequency": "monthly"
    }
```
#### Response
```json
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "new tea",
            "price": 5.99,
            "status": "active",
            "frequency": "monthly"
        }
    }
}
```

#### Request
`PATCH /api/v1/customers/:customer_id/subscriptions/:subscription_id/cancel`

#### Response
```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "title": "Becks tea selection",
            "price": 9.89,
            "status": "cancelled",
            "frequency": "monthly"
        }
    }
}
```

## Contributions
<p>🥟 Becky Nisttahuz:  Github: https://github.com/benistta Linkedin: https://www.linkedin.com/in/becky-nisttahuz/ </p>
