# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - installed rails
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) - has_many has_manys (parties have many dishes, users have many dishes, parties have many attendees (users))
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) - dish belongs to a party & user, party belongs to user (as host)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) - party has many foods through dishes
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) - foods have a name
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - food, party have validations on their forms
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - /dishes/most_popular will show you most popular dishes and how many parties they are at
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) - can create a new dish through a party /parties/:id/dishes/new
- [x] Include signup (how e.g. Devise) - devise sign up
- [x] Include login (how e.g. Devise) - devise sign in
- [x] Include logout (how e.g. Devise) - devise log out
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth) - I can't figure out where i'm going wrong with this, set up but some errors on facebook side of things.
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -  /users/:id/parties or /users/:id/dishes
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) - /parties/:id/dishes/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - forms show validation errors

Confirm:
- [x] The application is pretty DRY - need a little work here, but use 'form' where necessary
- [x] Limited logic in controllers - little to no logic in controllers
- [x] Views use helper methods if appropriate - a couple helper methods exist
- [x] Views use partials if appropriate - form partial used for party
