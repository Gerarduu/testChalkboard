
# Chalkboard Coding Challenge

## How to install the project

Simply clone the repository to your computer, open it with XCode, and run it. You don't need to install any Pods.

## The project

## Design Pattern

This task could be done in any design pattern, since it's a very little App. I choosed MVVM, because it's the design pattern I want to focus on, and because it's the design pattern most contemporary Apps are using nowadays.

The idea is simple, every ViewController, has its own ViewModel. The ViewModel processes the data, and when it finishes, notifies the ViewController via Protocols that it has to update it's UI.

# Most relevant files

#UI

## LoadingVC

VC that takes up the whole screen using constraints based on the device screen size, and always checks if there is another instance of itself in so as to not overlap.

## Navigation

File in charge of the navigation inside the App, when the App starts, sets the desired root VCs (in this case, fakeSplashVC).

## BaseVC

Father of all VCs, it contains common methods, that can be reusable, like "startWaiting", "stopWaiting", "showPopup", etc... All the other VCs have to heredate from this VC.

## FakeSplashVC

This file acts like a splash screen, showing an activity indicator while it's ViewModel the data from the API, if the API call successes it loads the HomeVC, if it throws an error, it shows a popup indicating the error and allowing you to try again.

## FakeSlashVM

Loads the data from the API using the generic API call from the APIClient file, and notifies the FakeSplashVC.

## HomeVC

VC that has a UITableview and recieves data from the fakesplashVC. When it loads, it reloads the tableview, in order to display the data recieved from the FakeSplashVC. When you tap on a row, it sends the data of the specific birthday to the DetailVC

## HomeVM

No need to apply logic to homeVM since it doesn't process data

## BirthdayTVC 

Custom TableViewCell displayng a concrete birthday. 

## DetailVC

Shows the data of the specific birthday. It doesn't have a VM because it does not need to process data.

# Networking Layer

## Birthdays

The birthday object model, used to decode the json object that the API returns.

## APIRouter

File to construct all the urls and its parameters, in the most reusable and scalable way.

## APIClient

File with a method that does a generic API Call in order to leave the network layer as simple and as scalable as possible. When you call this method, you must specify the model that will be used to decode the json object that the API will return and wich this method will return.

# Constants

## API

Constants file containing all the API related constants.

## UI

Constants file containing all the UI related constants.

# Enums

## AppError

File to integrate different custom error values.

## Buttons

File to integrate different custom button classes.

# Utils

## UIView+Utils

Extension to the UIView class, containing a method called "addConstraints", allowing to the UIView take up the whole screen. Used in LoadingVC.

## String+Utils

Extension to string class, containing the variable "localized", that allows to localize a string in localizable.strings, if available.

# Resources

## Localizable.strings

File containing all the literals of the App.

# Tests

## testChalkboardTests

File for the unit testing. By now it has the following tests:

- Check localizable.strings, has the correct texts.
- Check that the birthays route is returned correctly as a url request.
- Check that the main API path is correct.
- Test API Call to retrieve birthdays.


