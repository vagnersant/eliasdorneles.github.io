Title: Things I Learned from Destroy All Software - Season 1
Date: 2015-01-18 10:07
Author: elias
Slug: Things-I-Learned-from-Destroy-All-Software---Season-1

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">So,
a few weeks ago I purchased and watched the first season of</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Destroy
All Software
screencasts</span>](https://www.destroyallsoftware.com/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(from</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Gary
Bernhard</span>](https://twitter.com/garybernhardt)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),
and it was awesome. I'd say there are different kinds of stuff to learn
from it, depending on your personal interests and experience.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Here
are my notes for some things I found useful and want to remember for
later.</span>

</div>

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 21px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">About Git:</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
=================================================================================================================================================================================================================================================================

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">You
can use the  </span><span
style="background-color: transparent; color: black; font-family: Courier New, Courier, monospace; font-size: 15px; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">**git
rev-list HEAD**</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
 command to get a list of commits in the current branch. This is useful
for writing scripts to report something about each commit in the repo.
You can, for example, check the evolution of line counts over the course
of the project (or any other statistic like number of tests, number of
files, etc). You can also run the tests for every commit in the
history:</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">git
rev</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">list
HEAD</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="background-color: transparent; color: #000088; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">while</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
read rev</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">;</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="background-color: transparent; color: #000088; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">do</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
   git checkout \$rev</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">&&</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
git clean</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">fd</span><span
style="background-color: transparent; color: #666600; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">&&</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
make test;</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #000088; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">done</span></span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Gary
has a script ready for this:</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">run-command-on-git-revisions</span>](https://github.com/garybernhardt/dotfiles/blob/master/bin/run-command-on-git-revisions)

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">Git
tracks everything that happens in the local repo, even stuff that is not
shared when you push (like when you rewrite history doing a rebase). You
can use  </span><span
style="font-size: 15px; font-weight: bold; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">git
reflog</span></span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
 to see the history of local changes and  </span><span
style="font-size: 15px; font-weight: bold; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">git reset --hard
REFLOG\_ENTRY</span></span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
 to go back to where you were.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 21px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">About design:</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
====================================================================================================================================================================================================================================================================

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Avoiding
nil is good because it makes your code more predictable and tracebacks
more understandable.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">When
adding tests to a suite, it's important to pay attention at your stubs.
If they are getting complicated, the design can probably be improved in
a way that will render better tests and better production code.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">When
adding extra functions to a 3rd party API, sometimes it's tempting to do
monkey-patching of the library for a small change. It's usually better
to use a wrapper it instead, because later you will probably need more
changes and this will be easier if your production code is already using
a wrapper.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Isolated
tests are good because they run faster, they encourage better design and
code clarity. This is something I've read about repeatedly in the past
and also applied to some of the code I've done myself, so it's not that
new. But it was great to watch someone applying this on several
different code bases, showing some interesting paths -- it inspired me
to apply a bit more of this in my work.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 21px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">About Unix:</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
==================================================================================================================================================================================================================================================================

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">To
bring a background process to foreground, besides fg, you can also
use</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">%N</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
where N is the job number reported by the command jobs.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">You
can use the output of a command as if it were a filename, using
\<(COMMAND), like so:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\$ diff \<(echo)
\<(date)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">1c1</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\<</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">---</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\> Sat Jan 17
18:47:48 BRST 2015</span></span>

</div>

**  
**<span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">The
shell will run the commands and pass to the program file descriptors
with the proper contents, which you can verify doing:</span>  
**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\$ echo \<(ls -l)
\<(ls -l)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">/dev/fd/63
/dev/fd/62</span></span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">This
is useful for commands like diff that need more than one input file (and
therefore can't just use the stdin), to use it with arbitrary stuff
generated from other commands.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">I
found this specially helpful for when I want to refactor a script:
before I make changes, I store its original output in a file and then
while refactoring I keep comparing the output of the script with the
file to see if I'm not breaking anything:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">diff
\<(./my\_script) original.txt</span></span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">I
can also be useful to see differences between two different versions of
the same web application or sites:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">diff \<(curl -s
http://somesite.com)  \<(curl -s http://anothersite.com)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">  
</span></span>

</div>

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 21px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">About vim:</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
=================================================================================================================================================================================================================================================================

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">It's
nice to see people using vim well, because I can compare with my own
habits and see things where I can improve. Gary seems to strive to keep
a tight feedback loop in everything he's doing, so seeing him using vim
and the shell to build things in this fashion is pretty cool. I see it
as a nice validation for the choice of tools.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">I
found myself using splits a bit more, after watching the screencasts.
I'm more used to using vim tabs, mostly because I'm not much comfortable
with stuff happening outside my view. This is probably something I can
work better if I grow some tolerance for it.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Apart
from this, I stole a bunch of vim functions and ideas from</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Gary's
dotfiles</span>](https://github.com/garybernhardt/dotfiles)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
which I also share in</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">my
dotfiles</span>](https://github.com/eliasdorneles/dotfiles)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

</div>
