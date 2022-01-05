# Tea Time

### Description 
  Tea Time is a rails API created for consumption by a front-end team. Tea has a variety of endpoints that provide functionality for a Tea subscription service.
  
### Ruby/Rails Versions
 - Ruby: 2.7.2
 - Rails: 5.2.6

### Local Deployment
  For local deployment, run the following commands from the command line
  ```
    git clone git@github.com:acmassey3698/tea-time.git
    
    bundle install
    
    rake db:{drop,create,migrate}
  ```

### Running the Test Suite
The RSpec test suite can be run using the command 
```
bundle exec rspec
```

### Running the Server
To run the server for local endpoint testing (i.e. Postman)
```
rails s
```

### API Endpoints

<details>
  <summary>Create a New Subscription</summary>
  
  * Method: POST
  * Endpoint: `/api/v1/subscription`
  * Required Params: 
    * customer_email: <customer email>
    * tea_name: <tea name>
    * frequency <"weekly", "monthly", or "yearly">
  * Example Request: `http://localhost:3000/api/v1/subscriptions?customer_email=andrew@andrew.com&tea_name=yorkshire&frequency=monthly
  
  * Example Response: 
  ```
  {
    data: {
      id: 1,
      type: "subscription,
      attributes: {
        customer_email: "andrew@andrew.com,
        tea_name: "yorkshire,
        price: 10.0,
        status: "active"
        frequency: "monthly
      }
    }
  }
  ```
  
</details>
