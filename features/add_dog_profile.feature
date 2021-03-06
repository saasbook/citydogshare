Feature: Users should be able to add their dog's profile

As a non-professional user
In order to share my dog
I want to make a profile for my dog

Background: user has been added to the database and logged in
  Given the following users exist:
    | last_name  | first_name | location              | gender | image                      | status  | phone_number  | email                           | description  | availability   | address       | zipcode | city     | country | id |
    | Wayne      | Bruce      | Bat Cave, Gotham City | male   | http://tinyurl.com/opnc38n | looking | (555)228-6261 | not_batman@wayneenterprises.com | I love bats  | not nights     | 387 Soda Hall | 94720   | Berkeley | US      | 1  |
  And I am logged in
  And I am on the dogs page for "Batman"
  When I follow "Add your first dog!"

Scenario: Page redirects to edit user profile if user does not have zipcode
  And I am on the users page for "Batman"
  And I follow "Edit"
  And I fill in "user_zipcode" with ""
  And I press "Save Changes"
  And I follow the first "My Dogs"
  And I follow "Add your first dog!"
  Then I should see "Edit Your Profile"
  And I should see "Please update your zipcode to add a dog."
  And I should not see "Edit Your Dog's Profile"

Scenario: page shows error when all required fields are not filled
  When I press "Save Changes"
  Then I should see "Please enter a name"
  And I should see "Please select the mix"

Scenario: page shows error when some required fields are not filled
  When I fill in "dog_name" with "Spock"
  And I press "Save Changes"
  And I should see "Please select the mix"


Scenario: create dog profile
  When I am on the users page for "Batman"
  And I follow the first "My Dogs"
  Then I follow "Add your first dog!"
  When I fill in "dog_name" with "Spock"
  And I select "2010" from "dog_dob"
  And I select "Male" from "dog_gender"
  And I select "medium (16-40)" from "dog_size"
  And I select "curious" from "dog_personalities"
  And I fill in "dog_motto" with "Live long and play fetch."
  And I fill in "dog_description" with "Spock is out of this world. He even speaks Klingon"
  And I select "good" from "dog_energy_level"
  And I select "cats" from "dog_likes"
  And I fill in the first "dog_health" with "none"
  And I select "Yes" from "dog_fixed"
  And I attach the file "spec/factories/images/dog.jpg" to "dog_photo"
  And I select "Available" from "dog_availability"
  And I push "Save Changes"
  Then I should see "My Dogs"

