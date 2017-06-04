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
  (TODO: add instructions to have the proper API Level 15 installed)
* an Android emulator or a phone (TODO: add link to instructions on setting up phone)
* a little Java knowledge, if only to understand the Java API documentation

## Preparing the environment

You want to make sure that the environment variable `ANDROID_HOME` is pointing
to the path to your Android SDK. In my computer the Android SDK path is installed
in a folder `Android/Sdk` inside of my user directory.

## Hello World app

Let's create a "hello world" app.
Start by recreating the following directory and files structure:


    hello-app/
             hello/
                   __init__.py
                   app.py
                   __main__.py
             setup.py


Inside of the file `hello-app/setup.py`, put the following:

```
from setuptools import setup


setup(
    name='hello_android_app',  # no dashes allowed because Java naming, use only underscores
    version='0.0.1',
    packages=['hello'],
    options={
        'app': {
            'formal_name': 'Hello Android',
            'bundle': 'org.pybee.user.sandbox'
        },
    }
)
```

In the file `hello-app/hello/__main__.py`, put the following:

```
from hello.app import main


if __name__ == '__main__':
    main()
```

Finally, in `hello-app/hello/app.py`, add:

```
from android import PythonActivity  # provided by briefcase Android template

from android.view import LinearLayout, TextView  # classes from Android Java API


class HelloApp:
    def __init__(self):
        self._activity = PythonActivity.setListener(self)

    def onCreate(self):
        label = TextView(self._activity)
        label.setText('Hello Android World from Python!')

        vlayout = LinearLayout(self._activity)
        vlayout.addView(label)

        self._activity.setContentView(vlayout)


def main():
    HelloApp()
```

Create and activate a Python virtual environment in your favorite way.
If you don't have a favorite,
run these commands inside of the `hello-app` directory:

    python3 -m venv venv
    source venv/bin/activate

Next, install briefcase:

    pip install briefcase

Still inside of the `hello-app` directory, run the following command
to execute briefcase:

    python setup.py android

The above command will download an Android app template, compile our Python
code to Java .class files using VOC and setup an Android app inside a directory
named `android` inside of the `hello-app` directory.

<sub>
Note: You can re-run this command to regenerate the app any time. You'll need
to do this when you change code inside of the `hello/` directory and want to
see these changes reflected when running the app.
</sub>

If all goes well, by the end of this process you will see a message like this:

```
...
Installation complete.

Before you compile this Android project, you need to do the following:

    * Download the Android SDK Tools
    * Ensure you have Android API Level 15 downloaded
    * Ensure the ANDROID_HOME environment variable points at your Android SDK.
    * Configure your device for debugging

To compile, install and run the project on your phone:

    $ cd android
    $ ./gradlew run

To view logs while the project runs:

    $ adb logcat Python:* *:E

```

This message is telling us what to do to actually run the code in your Android
device (you can also just run an emulator instead).

If you have your environment setup correctly, all you have to do is to first
enter the `android` directory: `cd android`.

And then run the command:

    ./gradlew run

If it's the first time you do this, it may take several minutes to download
all the dependencies that this needs to work properly.
This command will compile all the java classes, run the Android tooling
to compile into the special Java bytecode and then attempt to launch the
app in your configured device or emulator.

If this works properly, you will see something like this:

<img src="http://i.imgur.com/mccVJKi.png" width="300" alt="Hello World app - screenshot">


## A slightly more useful app

TODO: show how to build a small app with buttons and some interactivity

## Tic Tac Toe

TODO: showcase the Tic Tac Toe app

https://github.com/eliasdorneles/tictactoe-voc
