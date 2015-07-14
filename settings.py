# -*- coding: utf-8 -*-
from __future__ import unicode_literals

SITENAME = 'Hopeful Ramble'

FILENAME_METADATA = '(?P<name>[^/]+)'

ARTICLE_URL = '{date:%Y}/{date:%m}/{date:%d}/{name}.html'

ARTICLE_SAVE_AS = ARTICLE_URL

MENUITEMS = [('Home', '')]

# I'm the only author
AUTHOR_SAVE_AS = ''

TIMEZONE = 'America/Sao_Paulo'

GITHUB_URL = 'https://github.com/eliasdorneles'

MONTH_ARCHIVE_SAVE_AS = 'posts/{date:%Y}/{date:%b}/index.html'

ARCHIVES_URL = 'archives.html'

# DISQUS_SITENAME = 'hopefulramble'
