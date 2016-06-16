Title: Getting productive with Git and your text editor
Date: 2016-06-16 00:29
Author: Elias Dorneles
Slug: getting-productive-with-git-and-your-text-editor
status: draft

Git is a fine tool for collaborating on software development. Many open source
developers would find hard to use any other thing.

However, there is all this learning curve you must go through until you're
finally actually productive with it. When you're just starting to use it, this
is very real:

<center>
[![](https://imgs.xkcd.com/comics/git.png)](https://xkcd.com/1597/)
</center>

You want to get stuff done, you don't want to be spending cognition on your
version control tool. With Git, it takes a while to get to a point where you
don't need to think much about it, at least when you're collaborating on a
project with many different people, as is the case in many open source
projects.

I remember the first time I submitted a pull request in GitHub and someone
asked me to squash the commits. This was way [before GitHub allowed you to do
this automatically when merging the pull
request](https://help.github.com/articles/about-pull-request-merge-squashing/),
I had no idea what they were talking about and there was no other Git user
around to help me. I was pretty much a noob on Git and GitHub, and it took me
months to figure out the whole thing. And in the end it didn't even got merged.

I never forgot this, which is why I avoid as much as possible to ask for
someone to rebase their code in a pull request (unless I know for sure they can do it).
It's easy to forget how scary this stuff can be for someone just starting
out with their first open source contribution.

And the thing is, this isn't something that's particularly hard to do.
It's the kind of thing that it's fairly easy to learn having someone else
showing you the way, but it can be quite scary when you're alone.

I've found there are many little things like this with Git.
It lacks good defaults. Or at least, user-friendly defaults -- I'm pretty
sure Git developers have good reasons to keep the defaults as they are.

I want to share with you the things I learned to get productive with Git, in
the hopes that it ease your learning curve and get you productive quicker.

I'm far from a Git expert, most of what I learned about was
getting stuff done, googling for _"how to do X with Git"_. I can hardly
understand Git's help because it seems to be written to people that know Git
internals, using all this vocabulary that I don't really understand.
But I can get stuff done nowadays, and you can get too. So, let's do this!

The first thing I want to show is:

### There is always a way to undo

This is true even if you've used `git rebase` or some other command that
rewrote the commit history. As long as you haven't deleted your local repo, you
can always get back to a previous state.

```
TIPS:
* git and bash aliases for human-friendly operations
  * git undo
  * git rk
  * git aa
  * git d & git dc
  * git ls
  * git cob
  * git pullr
  * git diff & git apply
  * enable rerere
  * em  # edit modified files
  * ec  # edit files with conflicts
```
