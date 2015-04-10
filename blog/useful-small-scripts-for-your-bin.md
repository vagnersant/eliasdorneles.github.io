Title: Useful small scripts for your ~_bin
Date: 2015-01-28 00:03
Author: elias
Slug: Useful-small-scripts-for-your-~_bin

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; line-height: 1.15; white-space: pre-wrap;">fields</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="line-height: 1.15;">  
</span></span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="line-height: 1.15;">So you are a command line geek, you do your
shell-scripts and one-liners using bash to get information you
need.</span></span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">You
use</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">cut</span>](http://en.wikipedia.org/wiki/Cut_(Unix))<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
for handling things delimited by some character like comma or space, but
sometimes you have a list of stuff separated by a varied amount of
spaces, like this:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat myfile.txt</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: white; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Amelia       555-5553     amelia.zodiacusque@gmail.com</span><span style="background-color: white; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
 </span><span style="background-color: white; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Julie        555-6699     julie.perscrutabor@skeeve.com</span>

  </div>
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">This
form of vertical alignment is cool because you can skim through any
column very quickly, but it makes your life a little bit
harder</span><span
style="font-family: Arial; font-size: 15px; white-space: pre-wrap;">
when processing it</span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
in the command line. Well, maybe you're smiling to yourself because you
already know about</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">awk</span>](http://en.wikipedia.org/wiki/AWK)<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">,
and you use it all the time for this kind of stuff doing something
like:</span>  
**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat myfile</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> awk</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'{ print \$3 }'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">amelia</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">zodiacusque@gmail</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">com</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">julie</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">perscrutabor@skeeve</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">com</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">That's
all fine,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">awk
is a great tool to
grok</span>](http://ferd.ca/awk-in-20-minutes.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
but typing all that just for getting out a field is a bit annoying. So
I've written a little script to make that yet easier: just</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">download
it</span>](https://github.com/eliasdorneles/dotfiles/raw/master/bin/fields)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and put somewhere in your \$PATH. After that, next time you find
yourself in this situation you'll do:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat myfile</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> fields 1</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Amelia</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Julie</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat myfile</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> fields 2</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">555-5553</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">555-6699</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat myfile</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> fields 2 3</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">555-5553</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span class="Apple-tab-span" style="white-space: pre;"></span></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">amelia.zodiacusque@gmail.com</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">555-6699</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span class="Apple-tab-span" style="white-space: pre;"></span></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">julie.perscrutabor@skeeve.com</span>

  </div>
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">total\_sum</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Another
thing you may found yourself running to awk is when you need a sum of
numbers. Often when you need a summation you will also need some more
stuff, and then it might be time to start writing a Python/Ruby/Perl
script instead of hacking in the command line. But I've often finding
myself wanting just a simple sum that justified putting the little awk
one-liner</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">into
a script of its
own</span>](https://github.com/eliasdorneles/dotfiles/raw/master/bin/total_sum)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\~</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">/bin/total\_sum</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #880000; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\#!/bin/bash</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #880000; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\# Report sum of numbers fed to the stdin</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">awk</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'{ total+=\$1 } END { print total }'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ echo</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">e</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"1\\n2\\n3\\n4"</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">4</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ echo</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">e</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"1\\n2\\n3\\n4"</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> total\_sum</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">10</span>

  </div>
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
** **  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">humanize</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">If
you find yourself having to count digits from a long number representing
the size in bytes of some big file, you're not alone.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">I
got tired of this and wrote</span><span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">[a
Python script to humanize these
numbers](https://github.com/eliasdorneles/dotfiles/blob/master/bin/humanize)</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
([download
here](https://github.com/eliasdorneles/dotfiles/raw/master/bin/humanize)),
shamelessly stealing the naturalsize function from the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">humanize
Python library</span>](https://pypi.python.org/pypi/humanize)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Look
how pleasant it is to use it:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ humanize 32432</span>

  </div>

  <p>
  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">32.4 kB</span>  
 <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ echo</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">e</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"10\\n1200\\n54356\\n3123342\\n3294384948"</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> some\_file</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat some\_file</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">10</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1200</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">54356</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3123342</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3294384948</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat some\_file</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> humanize</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">10 Bytes</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1.2 kB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">54.4 kB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3.1 MB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3.3 GB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$ cat some\_file</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">txt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">|</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> humanize</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">--</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">binary</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">10 Bytes</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1.2 KiB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">53.1 KiB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3.0 MiB</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3.1 GiB</span>

  </div>
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">That's
all I had, folks! :)</span>

</div>
