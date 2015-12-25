Title: Learning from DAS screencasts - season 3
Date: 2015-11-29 12:11
Author: elias
Slug: learning-from-das-screencasts-season-3
Tags: das-screencasts
Status: hidden

Here is a summary of my learning from watching [season 3 of Destroy All
Software screencasts](https://www.destroyallsoftware.com/screencasts/catalog).

# Which kind of code should go into Models?

Gary is fond of an architecture style for web applications which I rather like,
which is [pretty much the so-called clean architecture](http://rhodesmill.org/brandon/slides/2014-07-pyohio/clean-architecture/).

<center>
<img src="http://rhodesmill.org/brandon/slides/2013-05-djangoconeu/clean-architecture.jpg" alt="The Clean Architecture diagram" width="500" />
</center>

Following this architecture, the code inside model classes (in Rails, this
would be Active Record classes) should be either:

* validations/relationships
* mutation (set & save)
* wrapper (meaningful getter)
* queries (where/order/etc <- best to always be only there)
* creation (create and save)

And that’s it.

Things with more application logic (aka business rules) should go into their
own libraries, decoupled from the framework or ORM. This leaves the models with
no extra dependencies than the ORM, and make the code implementing the
application logic easier to test and modify.


# Outside-in TDD

Gary shows two approaches to do [outside-in
TDD](http://coding-is-like-cooking.info/2013/04/outside-in-development-with-double-loop-tdd/):

1. stubbing dependencies: here you program by wishful thinking, and design the
   dependencies by stubbing them out (i.e. using mocks to define the interaction
   with the code not yet implemented).


2. stash (using Git): implement a feature, but instead of stubbing a wished
   feature, stash the current code (i.e. set apart the current code via
   [git stash](http://www.gitguys.com/topics/temporarily-stashing-your-work/)),
   test and implement the wished feature TDD-style, commit it, unstash the
   previous code (git stash pop), finish implementing test with the newly
   developped code and then commit it.

Both approaches are valid and result in equivalent granularities, but the order
of commits will be different (with stubbing, the order will be more like
top-down) and tests with the stub approach tend to be more isolated.


# Testing code that calls HTTP APIs

Here is a cool idea: consider external HTTP APIs like “databases”, and test
your wrapper code mocking the HTTP interactions with a tool to replay
interactions like you would test with a fake database.

There is a neat tool for doing this called [vcr](https://github.com/vcr/vcr)
which is written in Ruby, there is a Python port called
[vcrpy](https://pypi.python.org/pypi/vcrpy).

What this VCR tool does is: it records HTTP requests into a "cassette" (an
[YAML file](https://en.wikipedia.org/wiki/YAML)) to replay the requests later
from it when running the tests and then checks if the requests match the
expected ones from the cassete file.

This makes the tests verify at the boundary of your app with the external HTTP
API, which is arguably more reliable than verifying interactions with proxy
objects (see [this talk for about this idea of
boundaries](https://www.destroyallsoftware.com/talks/boundaries).)

Here is the introduction for `vcrpy`:

> VCR.py simplifies and speeds up tests that make HTTP requests. The first time
> you run code that is inside a VCR.py context manager or decorated function,
> VCR.py records all HTTP interactions that take place through the libraries it
> supports and serializes and writes them to a flat file (in yaml format by
> default). This flat file is called a cassette. When the relevant piece of
> code is executed again, VCR.py will read the serialized requests and
> responses from the aforementioned cassette file, and intercept any HTTP
> requests that it recognizes from the original test run and return the
> responses that corresponded to those requests.

I've recently started using `vcrpy`, and I must say I rather like the approach.

One possible drawback of this approach is that the library must support the
HTTP library you're using, to be able to intercept the requests -- VCR.py
currently lacks support for Twisted Web Client.

# Dealing with untested Code

Tackling an untested method, adding tests and then refactoring it, keeping the test suite updated.


Can’t isolate upfront.
Sometimes you can start with smoke tests (e.g. simple output test of a happy path).


Gary’s example is a Rails controller method, he starts by writing Rspec contexts, one for every code path (namely, two for every conditional), then sort them from the happiest path to saddest path. Then he starts writing tests, making sure the tests fail for every context when appropriate.

## 
Note: these videos got me really envious of [RSpec](http://rspec.info/), it’s a
really powerful tool. I couldn't find any good equivalent for Python yet:
[mamba](https://github.com/nestorsalceda/mamba) looks promising, I really like
the API, but it's currently lacking proper packaging and documentation.
[pytest-describe](https://pypi.python.org/pypi/pytest-describe) almost cuts it,
but it only supports one level of nesting and its reporting is quite ugly due
to limitations of the implementation. If you don't care for a nice API and
just want a nice output you may try out [spec](https://github.com/bitprophet/spec)


# Emacs, chainsaw of chainsaws

Emacs is written in Elisp, and can be extended with Elisp -- this offers a
great level of customization. Also, Emacs environment knows about itself: for
example, the help system is dynamic and can even show your own custom shortcut
for a function.
Vim doesn’t have anything like that, help system are static text files.

> You can build vim inside Emacs, but you could never build Emacs inside vim.

However, a fresh Emacs installation (without customization) is less usable than
a fresh Vim installation.  Kinds of brittle and fragile tests Mocking vs. using
same dependencies used in production.

# Bash script demo

Nice structure of a script by creating lots of little functions.


When to generalize in TDD
3 situations (illustrative, not comprehensive)


TODO: cite here
Types of Tests


Negative expectations are dangerous.


Tests that obsess about implementation are bad.


It’s best to write tests against the broad interface of a class, instead of tests for helper methods in it.
