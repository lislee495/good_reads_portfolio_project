# ReadGood - Flatiron Portfolio Project

This is a rudimentary copy of the GoodReads website using CRUD (Create Read Update and Delete)
methodology. For its basic functionality, the site supports the creation of multiple users,
who can each create books (along with authors and genres, as byproducts of the book creation),
as well as add these books to their libraries (My Books). The users can view, add, edit and delete from their library, and they can view, add, edit, and delete from the main database of books that all users have access to. Deleting from one's library does not delete a book from the database, and users cannot interfere with the libraries of other users. Currently, to keep things simple, the app does not support
the independent CRUD of authors and genres. Once created, they can be seen, but they cannot be edited
or deleted.

## Getting Started

First, fork and clone the git repository from https://github.com/snickers495/good_reads_portfolio_project
Then open it up in your terminal and favorite editor. From the terminal, run `bundle install` to install
the gems. Then, run `rake db:migrate` to migrate the databases. From there, you can run
`shotgun`, copy the local development server address, and paste it into your browser search bar.

This should present you with a copy of the working site, where you can create a user, login,
and begin adding books to your library or to the books database.

## Built With

* Sinatra
* ActiveRecord
* Atom
* Bootstrap

## Contributing

Just myself.

## Authors

* **Lisa Lee** - *Initial work* - https://github.com/snickers495

## License

This project is licensed under Lisa Lee - or Flatiron School?

## Acknowledgments

* http://guides.rubyonrails.org/layouts_and_rendering.html
* Inspiration: https://www.goodreads.com/
* Bootstrap for all CSS services: https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css
