# Code-Challenge

App Design

The landing page is made up of a collection view and search bar. The collection view is prefilled with the query "Kobe Bryant"
upon loading. The user is prompted to enter a search term or phrase in the Search Bar. Once the user enters a query and presses "Search"
an API request is made and the page refreshes to reflect the query results.

Object Oriented Approach
  The APIService class was created to handle the business logic. This class contains all the API methods. 
  This is important because it serves a way to couple all logic needed to query, deserialize, and load the data into memory.
  The FlickrImage object was created to hold the title, imageURL, and publishDate values.

Local Env Setup
  Download the repo.
  Open a terminal window and navigate to the folder.
  Downloads Cocoapods if you don't have it already: https://cocoapods.org/
  Type 'pod install'
  Open Xcode and run the app.
