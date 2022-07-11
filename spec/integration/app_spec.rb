require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /hello" do
    it 'returns 200 OK with the right content' do
      response = get("/hello", name: "Leo")
      expect(response.status).to eq(200)
      expect(response.body).to eq('Hello Leo')
    end 
  end

  context "POST to /submit" do
    it 'returns 200 with the right content' do
      response = post("/submit", name: "Leo", message: "Hello world")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Thanks Leo, you sent this message: 'Hello world'")
    end
  end

  context "GET/names" do
    it "return 200 OK with the correct content" do 
        response = get("/names", name1: "Julia", name2:"Mary", name3:"Karim")
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

