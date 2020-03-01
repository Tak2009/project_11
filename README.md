# README

## Requirement
Using the language of your choice please 
    i. build your own API which calls the API at https://bpdts-test-app.herokuapp.com/, 
    ii. and returns 
        a) people who are listed as either living in London,
        b) or whose current coordinates are within 50 miles of London. 


###################################################################################################################################################################################

## Brief Explanation

1 - I used Ruby on Rails for my own API which calls the API at https://bpdts-test-app.herokuapp.com/.

2 - How to use my API:

    a. $ rails s to launch the web server then,
    b. once the server has launched, open http://localhost:3000/cities/london/users for the requirement ii- a) and http://localhost:3000/cities/within_50_mi_of_london/users for the requirement ii-b)

3 - You can find the logic for ii-a) and ii-b) in seed.rb as I applied it to the database seeding process so that the controllers can render the data faster with simpler logic

4 - For testing purposes, I used dummy data (3 records in seed.rd. They are all commented out) to check the accuracy against Google Maps. 
Currently the database includes only the data available at https://bpdts-test-app.herokuapp.com/. If you would like to test the logic and also would like to use the dummy data,
please drop the databases and schema.rb then: 

    a. $ rails db:migrate then,
    b. $ rails db:seed.

5 - Integration testing has been performed with RSpec to confirm that GET requests work properly.