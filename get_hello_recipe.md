# {{ GET }} {{ /hello }} Route Design Recipe

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method: GET
  * the path: /hello
  * any query parameters (passed in the URL)
    name(string)
  * or body parameters (passed in the request body)

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code. 

_Replace the below with your own design. Think of all the different possible responses your route will return._

When query param `name` is `Leo`

``Hello Leo``

When query param `name` is `Josh`

``Hello Josh``


```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /hello?name=Leo

# Expected response:
Hello Leo!
Response for 200 OK


## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/posts?id=1')

      expect(response.status).to eq(200)
      # expect(response.body).to eq(expected_response)
    end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "GET/names" do
    it "return 200 OK with the correct content" do 
        response = get("/names", name1: "Julia", name2:"Mari", name3:"Karim")
        expect(response.status).to eq(200)
        expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST/sort-names" do
    it "return 200 OK with correct content" do
        response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")
        expect(response.status).to eq(200)
        expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
