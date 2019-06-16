# __Nutritions & Smoothies__

First full-stack application using Rails.

## __Live link__
https://nutritions-smoothies.herokuapp.com/

## __How it looks__
<img alt="nutritions&smoothies homepage" src="/app/assets/images/homepage.png" width="500px">

## __Description__
All users can
  * browse through introduction of each nutrition category and its top food list
  * check recipes via nutrition category or via ingredient food that's on the top food list
  * view comments of each recipe (if any)
  * search recipes with ingredients and recipe names
Only authenticated users can
  * share their own recipes
  * edit/delete their own recipes
  * leave rating and comments on other users' recipes

## __Main Features__
  * Recipe search function
  * Image upload for each recipe via Cloudinary
  * User authentication system: user account creation, login and logout system
  * User authorisation system: users can only edit their own recipes, and only rate and comment others' recipes

## __Built with__
  * Ruby
  * Ruby on Rails
  * Creating database using PostgreSQL with 5 data models
  * Gems: pry-rails, Cloudinary, rails 12 factor
  * HTML
  * CSS

## __To Do__
- [ ] create user profile page
- [ ] use jQuery for 5x star rating
- [ ] further CSS adjustment, e.g. signup/login email box alignment, change layout for recipes list page etc.
