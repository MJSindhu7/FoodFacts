# FoodFacts

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Allows users to find nutritional information of food items by taking a photograph. 

### App Evaluation
- **Category:** Health
- **Mobile:** This application will be primarily developed for mobile usage only.
- **Story:** Allows users identify the nutritional value of a food item by snapping its photo.
- **Market:** All people who  manage their foods intake routine.
- **Habit:** The target audience will use this app on a daily basis to track their food nutrition value
- **Scope:** We want to create a complete ecosystem in the future where the user just needs to snap a photo of their food items and everything else will be autocompleted by the application to maintain a track of user's intake.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User signup.
* User login.
* User snaps a photo of the food item.
* User can search for food item nutritional information without photo.
* User is displayed the type of food item and the nutritional value based on the search/photo.

**Optional Nice-to-have Stories**
* User can favourite a food.
* Favorite food items are displayed in a favorite screen.
* User profile page.
* App maintains a history of all the photos taken and the search results.
* Settings (Accesibility, Notification, General, etc.)
* User can add nutritional information of foods to expand the application database.

### 2. Screen Archetypes
* Home
* Login
   * User Login.
* Sign up
   * User signup.
* Main
    * User snaps a photo of the food item.
    * User can search for food item nutritional information without photo.
* Nutrition
    * User is displayed the nutritional value of the food item based on search/photo.
    * User can favourite a food.

Optional:
* Favorite
    * Favorite food items are displayed in a favorite screen.
* Profile
    * User profile page.
* Search History
    * App maintains a history of all the photos taken and the search results.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

Optional:
* Main
* Profile

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Registration if no log in is available
* Auto-Login -> Photo screen with option to logout
* After Photo taken -> Popup shows nutrition information 

## Wireframes
<img src="https://github.com/MJSindhu7/FoodFacts/blob/main/Connecctions.png">

### [BONUS] Digital Wireframes & Mockups
<img src="https://github.com/MJSindhu7/FoodFacts/blob/main/MockScreens.png" width=600>

### [BONUS] Interactive Prototype
<img src="http://g.recordit.co/ROilVfnxXs.gif" width=300>

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
