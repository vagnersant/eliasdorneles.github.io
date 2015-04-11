Title: Tips on Performance and Monitoring of Java Applications
Date: 2014-06-16 20:06
Author: elias
Slug: Tips-on-Performance-and-Monitoring-of-Java-Applications

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">I
cleaned up my desk this weekend and ended up finding some notes I wrote
down some time ago when I attended a course about monitoring JBoss
application servers. I haven't been doing much related to Java Web
development lately, but I'm going to try to make a quick summary here
because: 1) then I can safely throw away the paper with the notes, and
2) I think some of the tips can still be useful in the context of many
long running JVM processes.</span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

### <span style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Memory and GC load</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 8pt;"}

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">So,
the most important thing to monitor in a long running JVM is arguably
the garbage collection stats. When some JVM is misbehaving, the first
thing you want to check is how much of the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">heap</span>](http://en.wikipedia.org/wiki/Java_virtual_machine#Heap)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
is being used and how often the full GC is being called.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">One
quick tip to reduce GC load is to set the initial heap size to the same
amount of the maximum heap size, namely, you should use the same value
for the</span><span
style="background-color: transparent; color: black; font-family: Courier New, Courier, monospace; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-Xms</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and</span><span
style="background-color: transparent; color: black; font-family: Courier New, Courier, monospace; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-Xmx</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
JVM options. When you do this the JVM will allocate the maximum space it
will ever use, right from the the start. This way you avoid memory
reallocation for the heap and some GC calls, and can even sometimes
speedup the startup of an application, it is usually the first thing I
do when I install a Java desktop app like Eclipse or Intellij
IDEA.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">There
are</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">some</span>](http://www.cubrid.org/blog/dev-platform/understanding-java-garbage-collection/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">nice</span>](http://www.cubrid.org/blog/dev-platform/how-to-monitor-java-garbage-collection/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">articles</span>](http://www.cubrid.org/blog/textyle/428187)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
about garbage collection in Java available, it's a fairly big topic and
I don't know much beyond the basics to survive. You definitely want to
know that full GC stops are bad and, although you can't avoid them
completely, you want to keep them to a minimum so your application won't
keep slogging.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Full
GC stops happen when the area of memory reserved to objects that are
"old" (namely, objects that have been around for most of the time and
therefore are probably going to be around in the future) reaches its
size limit. That means that whatever application code was running will
be stopped and only the GC will execute for a moment, until some space
is freed and your application code can execute again (</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">or
you'll be the misfortunate heir to an</span><span
style="background-color: transparent; color: #1155cc; font-family: Arial, Helvetica, sans-serif; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">OutOfMemoryError</span>](https://plumbr.eu/blog/understanding-java-lang-outofmemoryerror)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">As
it happens, tuning the garbage collection is very specific to the type
of application you're running. The JVM can use different garbage
collection algorithms, and you may want to twiddle with them a little
bit to see what works best. For your typical Java Web application, it's
usually better to run several machines with moderate memory in a cluster
than run all in one big machine with several GiB of memory due to how
the GC works. However, your mileage may vary, so your best bet is to
measure and monitor what's happening with the heap.</span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

### <span style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 16px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The number of threads vs backlog tradeoff</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 8pt;"}

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Now,
in the case of Web applications, the second most important thing you
want to watch is the busy threads count. Usually, it represents the
number of requests being handled at a given moment. There is an useful
tradeoff to be aware of that has to do with how these things happen
inside the Web container, so bear with me for a little bit with the
inaccurate description.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Whenever
your application server (or whatever it is you're using to deploy your
Java Web app) gets a new request, it tries to respond as soon as
possible creating a new thread to handle it, right? Then, when the
configured maximum number of threads is reached, all the new requests
are kept on a queue (sometimes called</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">backlog</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
or</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">acceptCount</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),
waiting until one of the current busy threads finishes so that the
server can then get the next request from the queue and use another
thread to handle it.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Well,
okay, it's not</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">reaaally</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
like that, I think what really happens is that each new request always
goes to the backlog queue and there are some threads responsible for
request processing that keep getting work from the backlog, but I
thought it would be a bit easier to explain that way.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>

</div>

<div class="separator" style="clear: both; text-align: center;">

[![woman thinking about how best to tune her Tomcat
installation](http://3.bp.blogspot.com/-1Op2WBzfGno/U5928NTAtqI/AAAAAAAAAwQ/d1lxWxNcmHY/s1600/doubt-maxThreads_vs_backlog.jpg "I think my Tomcat can handle more work... Now, should I increase maxThreads or the backlog?")](http://3.bp.blogspot.com/-1Op2WBzfGno/U5928NTAtqI/AAAAAAAAAwQ/d1lxWxNcmHY/s1600/doubt-maxThreads_vs_backlog.jpg)

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">But
here is the little secret: it's usually much easier for the operating
system to manage queues than attend threads. So, often enough it's
better to let the queue get big than to increase the maximum number of
threads for your system to handle. Threads are often competing for
resources, increasing its number may even hurt performance instead of
improve it, specially when you have a peak load.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Of
course the best thing to do will depend on the application you are
serving and the load patterns in your server, so you need to measure it
and experiment for a bit to figure out what numbers work best for
you.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">So,
if there is any way to wrap-up all this, it would be: measure it,
measure it, measure it! Different types of long-running JVM applications
will have different effects on your system, so it's important to have
data to make good decisions. Measuring the heap stats to see how the GC
is doing and the number of busy threads to see the patterns in request
handling (in the case of Web applications) is a good start.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-size: 15px;">  
</span><span style="font-size: x-small;">Thanks for the review, José
Ricardo and Valdir Stumm!</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-size: x-small;"><span
style="background-color: transparent; color: black; font-family: Arial; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Image
credits:</span><span
style="background-color: transparent; color: black; font-family: Arial; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="color: #1155cc; font-family: Arial; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;"><https://www.flickr.com/photos/24141546@N06/8097784516/in/photostream/></span><span
style="font-family: Arial; line-height: 14.949999809265137px; white-space: pre-wrap;">
*(CCBY)*</span></span>

</div>
