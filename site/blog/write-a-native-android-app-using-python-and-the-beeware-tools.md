Title: Write a native Android app using Python and the BeeWare tools
Date: 2017-05-17 16:36
Author: Elias Dorneles
Slug: write-a-native-android-app-using-python-and-the-beeware-tools

This tutorial will teach you how to write a native Android app using Python and
the tools available from the [BeeWare](https://pybee.org) suite, more specifically, the [VOC
compiler](https://github.com/pybee/voc) and
[briefcase](https://github.com/pybee/briefcase).

Note that the approach shown in this tutorial is specific to Android. If you
want to use the BeeWare tools to write cross-platform apps, you'll want to use
[Toga](https://github.com/pybee/toga) and [this project
template](https://github.com/pybee/briefcase-template).

I'm writing this because, even though the cross-platform apps is the main goal
of [BeeWare](https://pybee.org), it's cool to learn how to do the more specific
things, it's good to have choices.

We'll write Python code that will interoperate directly with the
[Android Java APIs](https://developer.android.com/reference/packages.html),
using VOC to generate Java classes from our Python code.

You'll need:

* Python 3.4+
* an Android development environment ([the easiest way is to install Android Studio](https://developer.android.com/studio/index.html))
* an Android emulator or a phone
* a little Java knowledge, if only to understand the Java API documentation

## Preparing the environment

You want to make sure that the environment variable `ANDROID_HOME` is pointing
to the path to your Android Sdk. In my computer the Android SDK path is installed
in a folder `Android/Sdk` inside of my user directory.

## Hello World app

Let's create a hello world app.

TODO: provide a skeleton of a hello world app for people to use,
explain how things are being built on top of each other.

## A slightly more useful app

TODO: app that converts Celsius to Fahrenheit, and vice versa.

## Tic Tac Toe

TODO: showcase the Tic Tac Toe app
