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

This occurs because it is easy to exceed the limit of time when you send the requests.

I will change that in near future for don't send too many requests.

That is the reason why I save the information of Launch Library on a database, but you can configure if you want save the data or show the http error instead of a list in your app.

![img8](https://i.ibb.co/ysHnbHD/flutter-space-app-img8.jpg)

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
It shows a list of the last saved OK 200 result.

![img9](https://i.ibb.co/ysHnbHD/flutter-space-app-img9.jpg)

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = true;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = true;
```
Save the last OK 200 result but shows the error instead of list.

![img8](https://i.ibb.co/ysHnbHD/flutter-space-app-img8.jpg)

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = true;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = false;
```
Don't save the data and shows the http error.

![img8](https://i.ibb.co/ysHnbHD/flutter-space-app-img8.jpg)

```dart
library flutter_space_app.globals;

// if you set true the request errors are showed in the app
// if you set false the app shows the last stored information
bool hiveShowHtmlErrorsBool = false;

// if you want save data of launch library on hive database put true, else put false
bool hiveSaveDateBool = false;
```
Don't save the data and shows an empty list.

![img12](https://i.ibb.co/ysHnbHD/flutter-space-app-img12.jpg)

### Debug Execute

On visual studio code

![imgDebugVS](https://i.ibb.co/ysHnbHD/flutter-space-app-img12.jpg)

On android studio

![imgDebugAndroid](https://i.ibb.co/ysHnbHD/flutter-space-app-img12.jpg)

### Obtain a release

* [Android](https://flutter.dev/docs/deployment/android)
* [iOS](https://flutter.dev/docs/deployment/ios)

## Usage

This it is an app that shows astronautics data, like spacecrafts, launches, space stations and more, the user only needs navigate through with buttons.

|![img1](https://i.ibb.co/ysHnbHD/flutter-space-app-img1.jpg)|![img2](https://i.ibb.co/ysHnbHD/flutter-space-app-img2.jpg)|![img4](https://i.ibb.co/ysHnbHD/flutter-space-app-img4.jpg)||![img10](https://i.ibb.co/ysHnbHD/flutter-space-app-img10.jpg)|![img11](https://i.ibb.co/ysHnbHD/flutter-space-app-img11.jpg)||

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

