# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - apparent
- [x] Use ActiveRecord for storing information in a database - all of the models are based on ActiveRecord
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - Books, Authors, Genres, and User models are all available in the Models folder of the CMV
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - User has_many Books, a Book has_many Users, a Genre and Author also each has_many Books
- [x] Include user accounts - yes, with the User model, which takes in password, email, and username
- [x] Ensure that users can't modify content created by other users - example of this viewable on line 14 and 37 of UserController
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - this is seen in Books model/BookController, which belong_to Authors and Genres, but also has full CRUD features
- [x] Include user input validations - viewable in ApplicationController line 25 with user sign up and 51 of login
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) - line 29 of ApplicationController flashes message "Username taken" if already taken, or in line 53 if login credentials are wrong.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - available in README.md in this project

Confirm
- [x] You have a large number of small Git commits - currently 36 commits
- [x] Your commit messages are meaningful - (e.g. "finished front pages layout" when I updated the CSS of all the front pages - sign up, login, homepage; more seen here: https://github.com/snickers495/good_reads_portfolio_project/commits/master)
- [x] You made the changes in a commit that relate to the commit message (e.g. "added nav to more, fixed patch, fixed buttons" when I added the nav bar to more pages, fixed the edit functionality, and fixed the way buttons looked)
- [x] You don't include changes in a commit that aren't related to the commit message - (https://github.com/snickers495/good_reads_portfolio_project/commits/master) never commited without a relevant message
