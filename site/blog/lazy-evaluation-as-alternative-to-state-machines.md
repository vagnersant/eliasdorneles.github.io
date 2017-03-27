Title: Lazy evaluation as alternative to state machines
Date: 2017-03-21 22:13
Author: Elias Dorneles
Slug: lazy-evaluation-as-alternative-to-state-machines

A few days ago I read [this nice article talking about co-routines as an
alternative to state machines](http://eli.thegreenplace.net/2009/08/29/co-routines-as-an-alternative-to-state-machines).

I was pretty excited, because since I first went through [David Beazley's material on
co-routines](http://www.dabeaz.com/coroutines/index.html) (which is pretty
cool) I've been wondering what exactly I could use it for. It's kind of hard
to come up with use cases different than handling asynchronous I/O stuff,
and [state machines](https://en.wikipedia.org/wiki/Finite-state_machine) are
kind of everywhere even if not always explicitly.

I've seen a few other examples that made some sense,
like David's [scheduler for cooperative tasks](http://www.dabeaz.com/coroutines/pyos8.py),
and a discrete event simulation
in the book [Fluent Python](http://shop.oreilly.com/product/0636920032519.do)
by [Luciano Ramalho](https://twitter.com/ramalhoorg).

So I decided to test out for myself reimplementing some simple state
machine as a co-routine and see how it goes. Along the way, I learned some
things and I'll tell you about it now.

First, let me try to tell you what are Python co-routines in 5 minutes.

## Co-routines in 5 minutes

You might be already familiar with generators. Here is a generator that
filter lines based on a pattern a la grep:

```
:::python
def grep(pattern, lines):
    for line in lines:
        if pattern in line:
            yield line
```

Generators are often used in for loops like this:

```
:::python
>>> lines = ["not a blank line", "i love python"]
>>> for m in grep("python", lines):
...     print(m)
... 
i love python
```

The difference between generators and co-routines is that generators
only produce values, while co-routines can receive values as well.
Here is a co-routine:

```
:::python
def grep(pattern):
    print("Searching for", pattern)
    while True:
        line = (yield)
        if pattern in line:
            print(line)
```

In the above example, the `yield` command pauses execution waiting
for some other co-routine or driving code to send a value.
Here's how we can use it:

```
:::python
>>> grep_coro = grep("python")
>>> next(grep_coro)  # get to the first yield
Searching for python
>>> grep_coro.send("testing")
>>> grep_coro.send("no no")
>>> grep_coro.send("i really love python")
i really love python
```

If this sounds fuzzy, don't worry, it's indeed weird when you see it for
the first time.
You can read a [lengthier explanation here](http://book.pythontips.com/en/latest/coroutines.html)
or follow through the [David Beazley's slides](http://www.dabeaz.com/coroutines/index.html) 
for deeper understanding of this.

The most popular use case for co-routines in Python has been asynchronous I/O,
and there are a bunch of Python things that use them (like
[Twisted](https://twistedmatrix.com), [Tornado](http://www.tornadoweb.org) and
the standard library module
[asyncio](https://docs.python.org/3/library/asyncio.html) which appeared in
Python 3.4).

Apart from the async stuff, to me they mostly look like complicated stuff that
even smart people have some trouble trying to think up useful use cases.

So I was curious about this idea of using co-routines as alternative of state
machines.

## Are co-routines an alternative to state machines?

To try out the idea, I decided to write a small program using a state machine,
and then write a co-routine version of it. I decided to implement a naive
program to strip out C-style comments using a state machine.

Here is the state machine version:

```
:::python
CODE, COMMENT, MAYBE_COMMENT, MAYBE_END_COMMENT = tuple(range(4))


def strip_comments(code):
    out = ''
    state = CODE
    prev_c = ''
    for c in code:
        if state == CODE:
            if c == '/':
                state = MAYBE_COMMENT
            else:
                out += c
        elif state == COMMENT:
            if c == '*':
                state = MAYBE_END_COMMENT
            else:
                state = COMMENT
        elif state == MAYBE_COMMENT:
            if c == '*':
                state = MAYBE_COMMENT
            else:
                state = CODE
                out += prev_c + c
        elif state == MAYBE_END_COMMENT:
            if c == '/':
                state = CODE
            else:
                state = COMMENT
        prev_c = c
    return out
```

We can test this code by giving it a string with Javascript code
with comments:

```
:::python
code = """
function add(a, b){
    /**
    * Function that adds two items
    */
    return a + b;
}
add(a, b); /* call add function */
"""

print(strip_comments(code))
```

And it will print the Javascript the code stripping out the comments:

```

function add(a, b){
    
    return a + b;
}
add(a, b); 

```

<small>
**Note:** This is not handling the case of `console.log("/* coment inside string */")`
because laziness, I'd need to add a few more states for parsing strings.
</small>

The `strip_comments` code looks a bit complicated, and that's a lot due to the
state machine related code: we define some states, and then for each new
character from the input we have to first check which state we're in before we
can decide what to do based on that information.
That's similar to the protocol wrapper code that the article had.

Now let's see how it would be if it were a co-routine.
We're going to turn the state-machine-based `strip_comments` function
into a co-routine, in pretty much the same way the article did.




<!-- Because co-routines are sort of complicated to understand, I think after you get -->
<!-- past the initial learning curve, it's only natural that you start trying to find -->
<!-- places where to use it -- even if that's not necessarily the best tool for the -->
<!-- job. -->
