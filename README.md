# flutter_space_app

Version: 0.1.0

A space flutter application.

## State

In progress.

## Description

### What is it?

This project is a project of one flutter application that shows news and data of
astronautics that come from [The Space Devs](https://thespacedevs.com/), network & public APIs.

I obtain the data from [Launch Library 2](https://thespacedevs.com/llapi) and [Spaceflight News API](https://thespacedevs.com/snapi).

In the project structure we have two separated parts for each API.

## Installation

1 Install flutter environment (if you have flutter installed, you can go to the next point).

* [Flutter installation](https://flutter.dev/docs/get-started/install)

2 Download zip or clone the project with git clone and open it.

### Configuration

In this project we have a file called globals.dart, that file have two global variables
to select if you want to watch the http errors on the screen or a list with results.

These parameters are only applied for launch library UI parts, because Launch Library 2
gives me the http error 429 too many requests.

<p>error 429</p>

<img src="https://i.ibb.co/3Sz10tT/flutter-space-app-img8.jpg" width="150">

This occurs because it is easy to exceed the limit of time when you send the requests.

I will change that in near future for don't send too many requests.

That is the reason why I save the information of Launch Library on a database, but you can configure if you want save the data or show the http error instead of a list in your app.

<p>If we have http problems we can show a list saved instead of error.</p>

<img src="https://i.ibb.co/qRDmWjm/flutter-space-app-img9.jpg" width="150">

### Configuration parameters

First, we need to go globals.dart file and we have a code with two global variables. 
If you modify it, it shows different results.

##### globals.dart


```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = false;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = true;
```
<p>It shows a list of the last saved OK 200 result.</p>
<img src="https://i.ibb.co/qRDmWjm/flutter-space-app-img9.jpg" width="250">

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = true;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = true;
```
<p>Save the last OK 200 result but shows the error instead of list.</p>
<img src="https://i.ibb.co/3Sz10tT/flutter-space-app-img8.jpg" width="250">

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = true;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = false;
```
<p>Don't save the data and shows the http error.</p>
<img src="https://i.ibb.co/3Sz10tT/flutter-space-app-img8.jpg" width="250">

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = false;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = false;
```
<p>Don't save the data and shows an empty list.</p>
<img src="https://i.ibb.co/ysHnbHD/flutter-space-app-img12.jpg" width="250">

### Debug Execute

<p>On visual studio code</p>
<img src="https://i.ibb.co/jHZFtnp/debug-vs-code.png" width="250">

<p>On android studio</p>
<img src="https://i.ibb.co/TD3z94s/android-studio-debug.png" width="350">


### Obtain a release

* [Android](https://flutter.dev/docs/deployment/android)
* [iOS](https://flutter.dev/docs/deployment/ios)

## Usage

This it is an app that shows astronautics data, like spacecrafts, launches, space stations and more, the user only needs navigate through with buttons.

|<img src="https://i.ibb.co/1rNKSsC/flutter-space-app-img1.jpg" width="200">|<img src="https://i.ibb.co/Cs09c4p/flutter-space-app-img4.jpg" width="200">|<img src="https://i.ibb.co/k3WGL31/flutter-space-app-img2.jpg" width="200">
|<img src="https://i.ibb.co/Mc0kGSS/flutter-space-app-img10.jpg" width="200">|<img src="https://i.ibb.co/LkfJwMC/flutter-space-app-img11.jpg" width="200">|<img src="https://i.ibb.co/tc8JyzK/flutter-space-app-img3.jpg" width="200">|


## License

MIT License

App icon source: 
* [icons8](https://iconos8.es/icons/set/rocket)
* [icons8 Rocket](https://iconos8.es/icon/59881/cohete)

## Changelog

### Version 0.1.0

* Added space flight news API sections: news articles, blogs, and ISS reports.
* Added launch library 2 API sections: launches, events, agencies, astronauts, space stations, launch vehicles and spacecraft.
* Added infinite scroll to launch library 2 API sections.


## Flutter documentation reference

General information about flutter and dart.

* [Flutter documentation](https://flutter.dev/docs)

* [Dart documentation](https://dart.dev/guides)

* [Flutter packages](https://pub.dev/)

* [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)

* [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

