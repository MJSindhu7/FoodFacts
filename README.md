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

* User registration.
* User login.
* User snaps a photo of the food item.
* User is displayed the type of food item.
* User is displayed the nutritional value of the food item based on photo.
* User can search for food item nutritional information without photo.
* Profile page for the user.

**Optional Nice-to-have Stories**

* History of the photos takes.
* History of the search results.
* Settings (Accesibility, Notification, General, etc.)
* User can add nutritional information of foods to expand the database.

### 2. Screen Archetypes

* Login
   * User Login.
* Register
   * User registration.
* Photo
    * User is displayed the type of food item.
    * User is displayed the nutritional value of the food item based on photo.
    * User can search for food item nutritional information without photo.
* Profile
    * Profile page of the user.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Photo
* Profile

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Registration if no log in is available
* Auto-Login -> Photo screen with option to logout
* After Photo taken -> Popup shows nutrition information 

## Wireframes
[Add a picture of all the screens with connections here]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups
[Add pictures of individual screens with screen name here]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Interactive Prototype
[Add the interactive Gif here]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
