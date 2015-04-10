Title: Web Scraping with Scrapy - first steps
Date: 2014-08-30 19:29
Author: elias
Slug: Web-Scraping-with-Scrapy---first-steps

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">Imagine
you want to extract content from the Web that isn't all in only one
page: you need a way to</span><span
style="font-family: Arial; font-size: 15px; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">navigate</span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
through the site to get to the pages that contain the useful
information. For example, maybe you want to get the latest</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">"big
questions" articles</span>](http://mentalfloss.com/big-questions)<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
of the</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Mental
Floss</span>](http://mentalfloss.com/)<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
website, but only those in the</span><span
style="font-family: Arial; font-size: 15px; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">Origins</span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
and</span><span
style="font-family: Arial; font-size: 15px; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">Fact
Check</span><span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
categories.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![mentalfloss-big-questions.png](https://lh6.googleusercontent.com/AjDSrHs8cDBjc7KfD2ljUpYm42lwClr3PSU2baGiDcDIUVWScyD7TfEKqeTA8gi3mzCik0tljsRj5QV-dl2kH1n2F15IME_OFqFOwUNhgPqcYLFZ_GsHF31HFekHUysQ3g)</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">If
you have an interest in Python and web scraping, you may have already
played with the nice</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">requests
library</span>](http://docs.python-requests.org/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to get content of pages from the Web. Maybe you have toyed around
using</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">BeautifulSoup</span>](http://www.crummy.com/software/BeautifulSoup/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
or</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">lxml</span>](http://lxml.de/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to make the content extraction easier. Well, now we are going to show
you how to use the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Scrapy
framework</span>](http://scrapy.org/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
which has all these functionalities and many more, so that solving the
sort of problem we introduced above is a walk in the park.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">It
is worth noting that Scrapy tries not only to solve the content
extraction (called</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scraping</span>](http://en.wikipedia.org/wiki/Web_scraping)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),
but also the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">navigation</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to the relevant pages for the extraction (called</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">crawling</span>](http://en.wikipedia.org/wiki/Web_crawler)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).
To achieve that, a core concept in the framework is the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
-- in practice, a Python object with a few special features, for which
you write the code and the framework is responsible for triggering
it.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Just
so that you have an idea of what it looks like, come on take a peek at
the code of a little program below that uses Scrapy to extract some
information (link, title and number of views) from a YouTube channel.
Don't worry about understanding this code yet, we're just showing it
here so that you have a feeling of a code using Scrapy. By the end of
this tutorial, you'll be able to understand and write programs like this
one. =)</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">from</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">contrib</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">loader</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">ItemLoader</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">YoutubeVideo</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Item</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    link</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    title</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    views</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">YoutubeChannelLister</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'youtube-channel-lister'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    youtube\_channel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'LongboardUK'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    start\_urls</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'https://www.youtube.com/user/%s/videos'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">%</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> youtube\_channel]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> sel</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"ul\#channels-browse-content-grid \> li"</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            loader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">ItemLoader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">YoutubeVideo</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(),</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> selector</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">sel)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            loader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">add\_xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'link'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'.//h3/a/@href')</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            loader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">add\_xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'.//h3/a/text()')</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            loader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">add\_xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'views'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">".//ul/li[1]/text()")</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> loader</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">load\_item</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Before
we talk more about Scrapy, make sure you have the latest version
installed using the command (depending on your environment, you may need
to use</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">sudo</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
or the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">--user</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
option for pip install):</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">pip
install --upgrade scrapy</span>

</div>

<p>
**  
**  

> <span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Note:</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> depending on your Python environment, the installation may be a bit
> tricky because of the dependency on</span>[<span
> style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Twisted</span>](https://twistedmatrix.com/)<span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
> If you use Windows, check out</span>[<span
> style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">the
> specific instructions in the official installation
> guide</span>](http://scrapy.readthedocs.org/en/latest/intro/install.html#platform-specific-installation-notes)<span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
> If you use a Debian-based Linux distro, you may want to use
> the</span>[<span
> style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">official
> Scrapy APT
> repository</span>](http://scrapy.readthedocs.org/en/latest/topics/ubuntu.html#topics-ubuntu)<span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>
> </p>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">To
be able to follow this tutorial, you'll need Scrapy version 0.24 or
above. You can check your installed Scrapy version using the
command:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">python
-c 'import scrapy; print("%s.%s.%s" % scrapy.version\_info)'</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
output of this command in the environment we used for this tutorial is
like this:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$
python -c 'import scrapy; print("%s.%s.%s" %
scrapy.version\_info)'</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0.24.2</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
anatomy of a spider</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![spider\_anatomy.jpg](https://lh6.googleusercontent.com/1OLnj7-I1_85hnfnovq6WbRDl3EQTs2xNxc_QpAZ7x2_twrGG0Olb3ZYG7wxA-QFaJVlxfLxNa14yVFSY4JxmlnTVLSJQ30isc4oifxUnFawhQC3PrIGhYxPOayRJHutZg)</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Scrapy
spider</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
is responsible for defining how to follow the links "navigating" through
a website (that's the so-called</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">crawling</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
part) and how to extract the information from the pages into Python data
structures.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">To
define a minimal spider, create a class extending</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Spider</span>](http://doc.scrapy.org/en/latest/topics/spiders.html#scrapy.spider.Spider)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and give it a name using the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">name</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
attribute:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">MinimalSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""The smallest Scrapy-Spider in the world!"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'minimal'</span>

  </div>
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Put
this in a file with the name</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">minimal.py</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and run your spider to check if everything is okay, using the
command:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider minimal.py</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">If
everything is fine, you'll see in the screen some messages from the log
marked as INFO and DEBUG. If there is any message marked as ERROR, it
means that there is something wrong and you need to check for errors in
your spider code.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
life of a spider starts with the generation of HTTP requests
(</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Request
objects</span>](http://doc.scrapy.org/en/latest/topics/request-response.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
to put in motion the framework engine. The part of the spider
responsible for this is the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_requests()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method, that returns an</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">iterable</span>](https://docs.python.org/2/glossary.html#term-iterable)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
with the first requests to be done for the spider.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Adding
this element to our minimal spider, we have:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">MinimalSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""The smallest Scrapy-Spider of the world, maybe"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'minimal'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> start\_requests</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">return</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Request</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">                </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> url</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://www.google.com'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">http://www.yahoo.com'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]]</span>

  </div>
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_requests()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method must return an</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">iterable</span>](https://docs.python.org/2/glossary.html#term-iterable)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
of</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Request</span>](http://doc.scrapy.org/en/latest/topics/request-response.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
objects, which represent an HTTP request to be made by the framework
(these contain data like URL, parameters, cookies, etc) and define a
function to be called when the request is complete -- a</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">callback</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

<p>
**  
**  

> <span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Note:</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> if you are familiar with implementing AJAX in JavaScript, this way of
> work dispatching requests and registering</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">callbacks</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> may sound familiar.</span>
> </p>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">In
our example, we return a simple list of requests to Google and Yahoo
websites, but the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_requests()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method could also be implemented as a</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Python
generator</span>](https://wiki.python.org/moin/Generators)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">If
you have tried to execute the example like it is now, you may noticed
that there is something still missing, because Scrapy will show two
messages marked as ERROR, complaining that a method was not
implemented:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">....</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
 File
"/home/elias/.virtualenvs/scrapy/local/lib/python2.7/site-packages/scrapy/spider.py",
line 56, in parse</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
   raise NotImplementedError</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">exceptions.NotImplementedError:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">This
happens because, as we didn't register a callback for the Request
objects, Scrapy tried to call the default callback, which is
the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method of the Spider object. Let's add this method to our minimal
spider, so that we can execute it:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">MinimalSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""The 2nd smallest Scrapy-Spider of the world!"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'minimal'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> start\_requests</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">return</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Request</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">                </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> url</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://www.google.com'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">http://www.yahoo.com'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">])</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">log</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'GETTING URL: %s'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">%</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url)</span>

  </div>
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Now,
when you execute it using the command:</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider minimal.py</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
you should see something like this in the output:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-07-26
15:39:56-0300 [minimal] DEBUG: Crawled (200) <get http:="http:">
(referer: None)</get></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-07-26
15:39:56-0300 [minimal] DEBUG: GETTING URL:
http://www.google.com.br/?gfe\_rd=cr&ei;=\_PXTU8f6N4mc8Aas1YDABA</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-07-26
15:39:57-0300 [minimal] DEBUG: Redirecting (302) to
<get https:="https:"> from </get><get https:="https:"></get></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-07-26
15:39:58-0300 [minimal] DEBUG: Crawled (200) <get https:="https:">
(referer: None)</get></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-07-26
15:39:58-0300 [minimal] DEBUG: GETTING URL:
https://br.yahoo.com/?p=us</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">To
make our code even cleaner, we can take advantage of the default
implementation of</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_requests()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:
if you don't define it, Scrapy will create requests for a list of URLs
in the attribute named</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_urls</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
-- the same kind of thing we're doing above. So, we'll keep the same
functionality and reduce the code, using:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">MinimalSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""A menor Scrapy-Aranha do mundo!"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'minimal'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_urls</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> [</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://www.google.com',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://www.yahoo.com',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    ]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">log</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'GETTING URL: %s'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">%</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url)</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Like
in the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method shown above, every callback gets the content of the HTTP response
as an argument (in a</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Response</span>](http://scrapy.readthedocs.org/en/latest/topics/request-response.html#scrapy.http.Response)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
object). So, inside this callback, where we already have the content of
the page, that's where we'll do the information extraction, i.e.,
the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">data
scraping</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
itself.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![excited-write-spider.jpg](https://lh3.googleusercontent.com/fTtt8VFXX5jcaTlMj9okmgKJxovkhZhKO392KqHkopX0oCmpPp0d8HA9tBY7vkTvE8NXlYR2NjAyeRJF0FW3A3BE01uI2YMH1Pkcq369Sx9pgARuSKH71mHM5TEumlOqFw)</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Callbacks,
Requests & Items</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Functions
registered as callbacks for the requests can return an iterable of
objects, in which every object can be:</span>

</div>

**  
**

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">an
    instance of a subclass of</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Item</span>](http://doc.scrapy.org/en/latest/topics/items.html)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
    which you define to contain the data to be collected from the
    page</span>

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">an
    object of type</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Request</span>](http://doc.scrapy.org/en/latest/topics/request-response.html)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    representing yet another request to be made (possibly registering
    another</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">callback</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span>

    </div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">With
this mechanism of requests and callbacks that may generate new requests
(with new callbacks), you can program the navigation through a site
generating requests for the links to be followed, until getting to the
pages that contain the items you're interested. For example, for a
spider that needs to extract products from the website of an online
store navigating through categories, you could use a structure like the
following:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">SkeletonSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'spider-mummy'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    start\_urls</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://www.some-online-webstore.com']</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> c</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[...]:</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            url\_category</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">...</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Request</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url\_category</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse\_category\_page</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse\_category\_page</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> p</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[...]:</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            url\_product</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">...</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Request</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url\_product</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse\_product</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse\_product</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">...</span>

  </div>
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">In
the above structure, the default callback --</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method -- handles the response of the first request to the online store
website and generates new requests for the pages of the categories,
registering another callback to handle them -- the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse\_category\_page()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method. This last method does something similar, generating the requests
for the product pages, this time registering a callback that extracts
the item objects with the product data.</span>

</div>

**  
**  

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 17px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Why do I need to define classes for the items?</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Scrapy
proposes that you create a few classes that represent the items you
intend to extract from the pages. For example, if you want to extract
the prices and details of products from an online store, you could use a
class like the following:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Product</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Item)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    description</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    price</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    brand</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    category</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>
  -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">As
you can see, the item classes are just subclasses from</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Item</span>](http://doc.scrapy.org/en/latest/topics/items.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
in which you add the desired fields (instances of the class</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy.Field</span>](http://doc.scrapy.org/en/latest/topics/items.html#scrapy.item.Field)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).
You can then use an instance of this class like if it were a Python
dictionary:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> p</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Product</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> p</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'price'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">13</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">print</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> p</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">{</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'price'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">13}</span>

  </div>
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
biggest difference from a traditional dictionary is that an Item by
default does not allow you to assign a value to a key that was not
declared as a field:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> p</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'silly\_walk'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">54</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">...</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">KeyError</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Product does not support field: silly\_walk'</span>

  </div>
  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
advantage of defining classes for items is that it allows you to take
advantage of other features of the framework that works for these
classes. For example,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">you
can use the feed exports
mechanism</span>](http://scrapy.readthedocs.org/en/latest/topics/feed-exports.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to export the collected items to</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">JSON</span>](http://en.wikipedia.org/wiki/JSON)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">CSV</span>](http://en.wikipedia.org/wiki/Comma-separated_values)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">XML</span>](http://en.wikipedia.org/wiki/XML)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
etc. You can also exploit the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">item
pipeline</span>](http://scrapy.readthedocs.org/en/latest/topics/item-pipeline.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
features, that allows you to plug-in other processing on top of the
collected items (things like validating the extracted data, removing
duplicated items, storing in a database, etc).</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Now,
let's do some scraping!</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">To
do the scraping itself, i.e., extracting the data from the page, it's
nice if you know</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">XPath</span>](http://en.wikipedia.org/wiki/XPath)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
a language created for doing queries in XML content which is core to
the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">selectors
mechanism of the
framework</span>](http://doc.scrapy.org/en/latest/topics/selectors.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
If you don't know XPath, you can use</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">CSS
selectors</span>](http://en.wikipedia.org/wiki/Cascading_Style_Sheets#Selector)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
in Scrapy just as well. We encourage you to learn some XPath
nevertheless, because it allows for expressions much more powerful than
just CSS (in fact, the CSS functionality in Scrapy works by converting
your CSS expressions to XPath expressions). We'll put some links to
useful resources about these at the end of the article.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">So,
you can test the result of XPath or CSS expressions for a page using
the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Scrapy
shell</span>](http://doc.scrapy.org/en/latest/topics/shell.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
Run the command:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
shell http://stackoverflow.com</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">This
command makes a request to the informed URL and opens a Python shell (or
IPython, if you have it installed) while making available some objects
for you to explore. The most important object is the
variable</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
which contains the response of the HTTP request and corresponds to
the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
argument received by the callbacks.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![dog-excited-even\_has\_a\_shell.jpg](https://lh3.googleusercontent.com/kdW_fmpWTyloxYfesyGVQdB-rx54lM-r1LIptocDvhxd6TsJ3__w4mWXMHI6o8SXvaO3tN19HhIf9kZ7iwZTztRpdF8g6HoHNA6aer7E-mk8jlM63o8taJVdPSA9EooORg)</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://stackoverflow.com'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">headers</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">{</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Cache-Control'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'public, no-cache="Set-Cookie", max-age=49',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Content-Type'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'text/html; charset=utf-8',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Date'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Sat, 09 Aug 2014 03:47:31 GMT',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Expires'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Sat, 09 Aug 2014 03:48:20 GMT',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Last-Modified'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Sat, 09 Aug 2014 03:47:20 GMT',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Set-Cookie'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'prov=5a8741f7-7ee3-4993-b723-72142d48696c; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Vary'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'\*',</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'X-Frame-Options'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'SAMEORIGIN'}</span>

  </div>
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">You
can use the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
methods of the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
object to query the HTML content in the response:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'//title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #880000; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\# gets the title via XPath</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[\<</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Selector</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'//title'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> data</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'</span>
  <title>
  Stack Overflow
  </title>
  '</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #880000; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\# gets the title via CSS</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[\<</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Selector</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'descendant-or-self::title'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> data</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'</span>
  <title>
  Stack Overflow
  </title>
  '</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> len</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'div'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">))</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #880000; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\# counts the number of div elements</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1345</span>

  </div>
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
result of calling one of these methods is a list object containing
selector objects resulting from the query. This list object has
an</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method which extracts the HTML content from all the selectors together.
The selectors, on the other hand, besides having their own</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method to extract their content, also have</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
methods that you can use to do new queries in the scope of each
selector.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Take
a look at the examples below in the same Scrapy shell, that will help
clearing up things a little bit.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Extracts
HTML content from</span>
<title>
element, calling the
</title>
</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method from the selector list (note that the result is a Python
list):</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'//title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'</span>
  <title>
  Stack Overflow
  </title>
  ']</span>

  </div>
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Stores
the first selector of the result in a variable and calls the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method on the selector (see how the result now is just a string):</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> title\_sel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'//title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> title\_sel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'</span>
  <title>
  Stack Overflow
  </title>
  '</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Applies
the XPath expression</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">text()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to get the text content of the selector, and calls the extract() method
from the resulting list:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> title\_sel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'text()'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">u</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'Stack Overflow']</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Prints
the extraction of the first selector resulting of the XPath
expression</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">text()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
applied to selector in variable title\_sel:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\>\>\></span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">print</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> title\_sel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'text()'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">].</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Stack</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Overflow</span>

  </div>
  -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Well,
when you have a good grip on this way to work with selectors, the simple
way to extract an item is just to create an instance of the desired Item
class and fill the values obtained using this selectors API.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Here,
take a look at the code of a spider using this technique to get the most
frequently asked questions of</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">StackOverflow</span>](http://stackoverflow.com/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> urlparse</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Question</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Item</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    link</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    title</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    excerpt</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    tags</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">StackoverflowTopQuestionsSpider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'so-top-questions'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> \_\_init\_\_</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> tag</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">None</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        questions\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://stackoverflow.com/questions'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">if</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> tag:</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            questions\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">+=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'/tagged/%s'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">%</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> tag</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_urls</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">questions\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">+</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'?sort=frequent']</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        build\_full\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">lambda</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> link</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> urlparse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">urljoin</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> link)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> qsel</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"\#questions \> div"</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            it</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Question</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            it</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'link'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> build\_full\_url(</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">                qsel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'.summary h3 \> a'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'@href'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">].</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">())</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            it</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> qsel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'.summary h3 \> a::text'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">].</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            it</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'tags'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> qsel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'a.post-tag::text'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            it</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'excerpt'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> qsel</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'div.excerpt::text'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">].</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> it</span>

  </div>
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">As
you can see, the spider defines an Item class named</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Question</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
and uses the Selectors API to iterate through the HTML elements of the
questions (obtained with the CSS selector</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\#questions
\> div</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
and generating a Question object for each one of these elements, filling
all the fields (link, title, tags and question excerpt).</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">There
are two interesting things worth noticing in the extraction done in
the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
callback: the first one is that we use a pseudo-selector</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">::text</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to get the text content of the elements, avoiding the HTML tags. The
second is how we use the function</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">urlparse.urljoin()</span>](https://docs.python.org/2/library/urlparse.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to combine the URL of the request with the content of the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">href</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
attribute, making sure that the result of this will be a correct
absolute URL.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Put
this code in a file named top\_asked\_so\_questions.py and run it using
the command:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider top\_asked\_so\_questions.py -o questions.json</span>  
<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">If
everything went well, Scrapy will show in the screen the scraped items
and also write a file named</span><span
style="color: black; font-family: Arial; font-size: 15px; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">questions.json</span><span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
containing them. At the end of the output, you should see some stats,
including the item scraped count:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-08-02
14:27:37-0300 [so-top-questions] INFO: Dumping Scrapy stats:</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">{'downloader/request\_bytes':
242,</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
'downloader/request\_count': 1,</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
...</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'item\_scraped\_count':
50,</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
'log\_count/DEBUG': 53,</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
'log\_count/INFO': 8,</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
...</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
class="Apple-tab-span" style="white-space: pre;"></span></span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
'start\_time': datetime.datetime(2014, 8, 2, 17, 27, 36, 912002)}</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2014-08-02
14:27:37-0300 [so-top-questions] INFO: Spider closed (finished)</span>

</div>

> <span
> style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">**Note:**</span><span
> style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
> if you run this twice in a row, you need to remove the output file
> questions.json file before each run. This is because</span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;"></span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">Scrapy </span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">by
> default</span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">
> appends to a file instead of overwriting it, which ends up making the
> JSON file unusable. This is done</span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">
> for historical reasons,</span><span
> style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">it
> made sense for spiders which used the JSON Lines format (the previous
> default), and may change in the future.</span>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![question\_block\_little\_dudes-are\_belong\_to\_us.jpg](https://lh5.googleusercontent.com/8wSeSQMfk_DBDrTpejqaBlAhoazIg--pdjDWfk5vcIhB504FSu78MEULRtnuYPN-0FVjuX23OWnqIEzf_j0YorWy42EQcTnUVKfqF9-UfbpSu-nuZ4iXB5m15WPhXqBLXw)</span>

</div>

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 17px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Arachnoid arguments</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">You
may have noticed that the class for this spider has a constructor
accepting an optional argument called</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">tag</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
We can specify a value for this argument for the spider to get the
frequently asked questions with the python tag, using the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-a</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
option:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider top\_asked\_so\_questions.py -o
python-questions.json</span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">**-a
tag=python**</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Using
this little trick you can write generic spiders, so that you just pass
some parameters and get a different result. For example, you may write
one spider for several sites that have the same HTML structure, making
the URL of the site a parameter. Or, a spider for a blog in which the
parameters define a time range of the posts and comments to
extract.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Putting
it all together</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">In
the previous sections, you saw how to do web crawling with Scrapy,
navigating through the pages of a site using the mechanism of requests
and callbacks. You also saw how to use the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Selector
API</span>](http://doc.scrapy.org/en/latest/topics/selectors.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
to extract the content of a page into items and execute the spider using
the command</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Now,
we shall put it all together in a spider that solves the problem we
presented in the introduction: let's scrape the latest "big questions"
articles from</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">mentalfloss.com</span>](http://mentalfloss.com/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
offering an option to inform the category (</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Origins</span>](http://mentalfloss.com/big-questions/origins)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">The
Body</span>](http://mentalfloss.com/big-questions/the-body)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Fact
Check</span>](http://mentalfloss.com/big-questions/fact-check)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
etc). This way, if you just run the spider, it should scrape all the
articles in the blog; if you pass in a category, it should scrape only
the articles of that subject.</span>

</div>

<p>
**  
**  

> <span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Note:</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> Before writing a spider, it's useful to explore a little bit the pages
> of the site using the browser's inspection capabilities and
> the</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
> shell</span><span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
> so that you can see how the site is structured and you can also try a
> few CSS or XPath expressions in the shell. There are also some browser
> extensions that allow you to test XPath expressions directly in a
> page:</span>[<span
> style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">XPath
> Helper</span>](https://chrome.google.com/webstore/detail/xpath-helper/hgimnogjllphhhkhlmebbmlgjoejdpjl?hl=en)<span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> for Chrome and</span>[<span
> style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">XPath
> Checker</span>](https://addons.mozilla.org/en-US/firefox/addon/xpath-checker/)<span
> style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
> for Firefox. Discovering the best way to extract the content of a site
> using XPath or CSS is more of an art than a science, therefore we
> won't try to explain much here, but it's worthy telling you that you
> learn a lot after a little experience.</span>
> </p>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Have
a look at the final code of the spider:</span>

</div>

**  
**

<div dir="ltr" style="margin-left: 0pt;">

  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">import</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> urlparse</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Item</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    title</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    content</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    link</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    author</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    date</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Field</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">class</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">MentalFlossArticles</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Spider</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    name</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'mentalfloss-articles'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> \_\_init\_\_</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> category</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">None</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        articles\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'http://mentalfloss.com/big-questions'</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">if</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> category:</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            articles\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">+=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'/'</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">+</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> category</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start\_urls</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">articles\_url]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> parse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""Gets the page with the article list,</span>  
 <span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        find the article links and generates</span>  
 <span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> requests for each article page</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article\_links</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">xpath(</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"//header/hgroup/h1/a/@href"</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">for</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> link</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">in</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> article\_links:</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            article\_url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> urlparse</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">urljoin(</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">                response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> link)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> scrapy</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Request</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">article\_url,</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">                                 </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract\_article)</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">    </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">def</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> extract\_article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">self</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">):</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""Gets the article page and extract</span>  
 <span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> an item with the article data</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"""</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #660066; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">lambda</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> s</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">s</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">()</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'link'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> response</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">url</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'title'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"h1.title \> span::text"</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'date'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'.date-display-single::text'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'content'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">" "</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">join(</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            css</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'\#content-content p::text'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">))</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        article</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">[</span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">'author'</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">]</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> css(</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"div.field-name-field-enhanced-authors"</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">            </span><span style="background-color: transparent; color: #008800; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">" a::text"</span><span style="background-color: transparent; color: #666600; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)[</span><span style="background-color: transparent; color: #006666; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">0]</span>

  </div>

  <div dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

  <span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">        </span><span style="background-color: transparent; color: #000088; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">yield</span><span style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"> article</span>

  </div>
  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Just
like before, you can run the spider with:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider mentalfloss.py -o articles-all.json</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">And
to get the articles from each section, you can use commands like:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider mentalfloss.py -o articles-origins.json -a
category=origins</span><span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>  
<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: 'Ubuntu Mono'; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">scrapy
runspider mentalfloss.py -o articles-fact-check.json -a
category=fact-check</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
code for this spider has a very similar structure to the previous one,
with its argument handling and everything.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
main difference is that in this one, the first callback (the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">parse()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method) generates other requests for the article pages, which are
handled by the second callback: the</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">extract\_article()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
method, which scrapes the article data.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">The
content extraction also does a little bit more work. We created
a</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">css()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
helper function to abbreviate calling</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">response.css(  
<selector>).extract()</selector></span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and used that to get the result of our selectors to fill the Article
item. Note also how we take advantage of</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Python's
feature of concatenating literal
strings</span>](https://docs.python.org/2/reference/lexical_analysis.html#string-literal-concatenation)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
on the CSS selector for the author field, to break it in two
lines.</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Final
words</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">If
you made until here, congratulations! Here is a trophy for you:</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">![scrapy-trophy.jpg](https://lh3.googleusercontent.com/EboKX-uRyuikN3lI8voa529LP3W6OnHn3vjWi21fvisFEpbuPu-fPY9be1Z3PB_CxT991AL0SquUnypXp4-sbiMTdVY8hiVu_zrbUdFPVhu5BixW6Mu3LUE9Jbz37Jn8Iw)</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Now
that you have learned to write Scrapy spiders and therefore are enabled
to download the whole Internet to your home PC, try not to get banned by
the website hosts laying around! :)</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Visit
the</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">official
documentation for Scrapy</span>](http://doc.scrapy.org/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
there is a lot of good stuff there, like</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">the
tutorial teaching you how to create complete Scrapy
projects</span>](http://scrapy.readthedocs.org/en/latest/intro/tutorial.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">frequently
asked
questions</span>](http://scrapy.readthedocs.org/en/latest/faq.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">tips
for doing huge
crawls</span>](http://scrapy.readthedocs.org/en/latest/topics/broad-crawls.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">how
to debug a
spider</span>](http://scrapy.readthedocs.org/en/latest/topics/debug.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">tips
on how to avoid being
banned</span>](http://scrapy.readthedocs.org/en/latest/topics/practices.html#avoiding-getting-banned)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
and a lot more.</span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">  
</span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">**UPDATED:**
removed </span><span
style="font-size: 15px; line-height: 17.25px; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">-t
json</span></span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">
from commands, </span><span
style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">unnecessary</span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">since
Scrapy 0.24 (thanks, Mikhail!)</span>  
<span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">  
</span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">**UPDATED:**
added note about Scrapy default</span><span
style="font-family: Arial; font-size: 15px; line-height: 17.25px; white-space: pre-wrap;">
behavior of</span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">appending
to output file (thanks again, Mikhail!)</span>

</div>

**  
**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 10pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: #666666; font-family: 'Trebuchet MS'; font-size: 17px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Useful
resources:</span>

</div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Scrapy
    - Official Documentation</span>](http://doc.scrapy.org/en/latest/)

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Scrapy
    Wiki with links to videos, slides, articles and related
    projects</span>](https://github.com/scrapy/scrapy/wiki)

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">scrapy-users
    Google Group - mailing
    list</span>](http://groups.google.com/group/scrapy-users/)

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Nice
    XPath Tutorial</span>](http://zvon.org/comp/r/tut-XPath_1.html)

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Some
    XPath
    tips</span>](http://blog.scrapinghub.com/2014/07/17/xpath-tips-from-the-web-scraping-trenches/)

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    [<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">The
    30 CSS selectors you need to
    memorize</span>](http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048)

    </div>


