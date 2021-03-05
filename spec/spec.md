Specifications for the Sinatra Assessment

Specs:

 [x] Use Sinatra to build the app
    - Listed in Gemfile. The app is centered around routes.

 [x] Use ActiveRecord for storing information in a database
    - Listed in Gemfile. Migrations create tables, associations are established in models classes.

 [x] Include more than one model class (e.g. User, Post, Category)
    - User and Destinations model classes.

 [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - User has_many Destinations.

 [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - Destination belongs_to User.

 [x] Include user accounts with unique login attribute (username or email)
    - Email has unique valdator and conditional logic that looks for existing email before creating new user.

 [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - Completed this task in 'destinations_controller.rb'.

 [x] Ensure that users can't modify content created by other users
    - User can view other users destinations, but can't tamper with other users destinations. Edit and delete routes compare the session variable to the current destination the user is attempting to modify.

 [x] Include user input validations
    - New user must have unique email. Validates users are logged in for post routes and own destinations they are attempting to edit.

 [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    - Included a few. Example: If user enters incorrect password on login, a flash message appears that says password is incorrect.

 [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - DONE! Available in the root directory.

Confirm:

 [x] You have a large number of small Git commits
    - DONE! Can be seen on github.

 [x] Your commit messages are meaningful
    - DONE! Made them meaningful and relative to the work that was done prior to the commit.

 [x] You made the changes in a commit that relate to the commit message
    - DONE! Changes reflect the message.
 
 [x] You don't include changes in a commit that aren't related to the commit message
    - DONE! Can be seen on github.