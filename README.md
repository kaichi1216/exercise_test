# README

* Ruby version 2.6.6

* Rails version 6.1.5

# Exercise A

**Mission**

`Build an Raise Limit Server to Server the incomming request`

**Result Description**

` Use redis to store request ip and set requests limit 60 per minute，if requests is meet threshold，than server will return status 429 and response message is "You have fired too many requests. Please wait for a couple of minutes."`

# Exercise B

**Mission**

`Build an Voting Server determine an issue about Wuhan coronavirus`

**Result Description**

` Use redis to store vote result`

* TWO API

  * method: GET  /api/wuhan_coronavirus 
    * response body
    ```
    {
      "yes": INTEGER,
      "no": INTEGER
    }
    ```

  * method: POST  /api/wuhan_coronavirus 
    * request body
    ```
    #no => 0, yes => 1
    {
        res: INTEGER
    }
    ```
