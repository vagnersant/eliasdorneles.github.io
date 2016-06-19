Getting productive with Git and your text editor
################################################

:date: 2016-06-19 00:29
:author: Elias Dorneles
:slug: getting-productive-with-git-and-your-text-editor

I remember the first time I submitted a pull request in GitHub and someone
asked me to squash the commits. I had
no idea what they were talking about. I didn't have any friends who knew Git, I
was pretty much a noob on Git and GitHub.

.. figure:: {filename}/images/confused.png
    :height: 250px
    :align: center

    First-timer OSS contributor asked to rebase and squash commits

It took me several weeks to figure out the whole thing because I was so afraid
of messing up. And in the end the code didn't even got merged.

I never forgot this, which is why today I avoid as much as possible to ask for
someone to rebase their code in a pull request, unless I can pair with them
and show how to do it.
It's easy to forget how scary this stuff can be for someone just starting
out with their first open source contribution.

Well, nowadays `GitHub allows a maintainer to squash commits when merging
<https://help.github.com/articles/about-pull-request-merge-squashing/>`_,
which is pretty cool. But the thing is, this isn't a task that's particularly
hard to do. When you have someone else to show you how, you pick it up real
fast, but it can be scary when you're on your own.

I've found there are many little things like this with Git. Git is a fine tool
for collaborating on software development and many open source developers would
find hard to use any other thing.

However, there is all this learning curve you must go through until you're
finally actually productive with it. When you're just starting to use it, this
XKCD comic is very real:

.. image:: https://imgs.xkcd.com/comics/git.png
    :align: center
    :target: https://xkcd.com/1597

You want to get stuff done, you don't want to be spending cognition on your
version control tool. With Git, it takes a while to get to a point where you
don't need to think much about it, at least when you're collaborating on a
project with many different people, as is the case in many open source
projects.

I want to share with you the things I learned to get productive with Git, in
the hopes that it ease your learning curve and get you productive quicker.

I'm far from a Git expert, most of what I learned about was while trying to
getting stuff done, usually after googling for _"how to do X with Git"_. I have
trouble understanding Git's help because it seems to be written to people that
know Git internals, using all this vocabulary that I'm not familiar. But I can
get stuff done nowadays, and you can get too.

The first thing I want you to know is:

There is always a way to undo
=============================

This is true even when you've used one of the power tools (``git rebase``) that
rewrites the commit history. As long as you haven't deleted your local repo,
you can always get back to a previous state.

Undo a commit
-------------

If you've commited and then realized that you didn't mean to,
don't worry, you can undo it with the following command::

    git undo-commit

This will undo the last commit, but will keep your files intact
so you won't lose any work.

Now, if you've just tried that and it didn't work it's because
I've lied to you -- sorry! That command doesn't exist by default
in Git, but it should! In order to add it, run the following command::

    git config --global --add alias.undo-commit 'reset HEAD~1 --mixed'

This adds an alias, which is essentially a shortcut to another command.
Git aliases are very helpful, because that's how you tweak Git's complicated
command line interface to something that's actually usable. Aliases (and
Git's global configuration for your user) are stored in a ``.gitconfig``
file in your user directory, which you can edit using your editor if you like.

Later on, we'll see how to use Bash aliases and functions to further improve the workflow.

You can check `my personal gitconfig <https://github.com/eliasdorneles/dotfiles/tree/master/gitconfig>`_
(which contains the stuff I share here and more) if you came here just for Git aliases.

You can use any other alias name that you prefer instead of ``undo-commit``
there. Personally, I use just ``undo`` for this one.


Undo adding a file to commit
----------------------------

If you've added a file with ``git add`` that you didn't mean to,
you can undo it with::

    git undo-add

Again, this is only after you've added the proper alias with the following command::

    git config --global --add alias.undo-add 'reset --keep'


Undoing a rebase gone wrong
---------------------------

If you've tried doing a rebase or some other command that rewrote the commit history
and you want to undo it, you can use something called the `reference log` (or, reflog).
Try running ``git reflog`` in a Git repository, you'll see something like this::

    26e15cf HEAD@{0}: rebase finished: returning to refs/heads/master
    26e15cf HEAD@{1}: pull --rebase: moving basic path config to ~/.profile to work with gnome apps
    f993d5c HEAD@{2}: pull --rebase: checkout f993d5cc3d6df6ce9f5c083ebf17d45b9c7e9130
    b517509 HEAD@{3}: pull: Merge made by the 'recursive' strategy.
    29438f2 HEAD@{4}: commit: moving basic path config to ~/.profile to work with gnome apps
    a000618 HEAD@{5}: clone: from git@github.com:eliasdorneles/dotfiles.git

This is a log of every state of your files that is stored, which includes
when you commit changes, checkout branches, do rebases (with separate states
for every step of the rebase), merges and etc.

You can get back to any of those states, using the command below, replacing
``REFLOG_ENTRY`` by the ``HEAD@{index}`` from the reflog for the state
you want to go back::

    git reset --hard REFLOG_ENTRY

Note that those numbers are counting backwards, they change every time you make
a change in the repo. You want to always run ``git reflog`` before going back,
to be sure you'll use the up-to-date reference.

Also, note that these logs are only stored locally, you'll lose them if you delete
your local repo.

------------------

Alrighty, we're done coverging undoing stuff. I hope now that you know this,
you will feel less afraid of breaking things.


::

    TIPS:
    * git and bash aliases for human-friendly operations
      * git aa
      * git d & git dc
      * git ls
      * git cob
      * git pullr
      * git diff & git apply
      * enable rerere
      * em  # edit modified files
      * ec  # edit files with conflicts
