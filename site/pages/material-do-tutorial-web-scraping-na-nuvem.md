Title: Material do Tutorial: Web Scraping na Nuvem
Date: 2015-11-13 10:04
Author: elias
Slug: material-do-tutorial-web-scraping-na-nuvem
Status: hidden


## Roteiro

* Introdução a web scraping com [Scrapy](http://scrapy.org/)
* Conceitos do Scrapy
* Hands-on: crawler para versões diferentes dum site de citações
* Rodando no [Scrapy Cloud](http://scrapinghub.com/platform/)

O tutorial é 90% Scrapy e 10% Scrapy Cloud.

> **Nota:** Scrapy Cloud é o serviço PaaS da Scrapinghub, a empresa em que
> trabalho e que é responsável pelo desenvolvimento do Scrapy.

### Precisa de ajuda?

Pergunte no [Stackoverflow em Português usando a tag
scrapy](http://pt.stackoverflow.com/tags/scrapy) ou pergunte em inglês no
[Stackoverflow em inglês](http://stackoverflow.com/tags/scrapy) ou na [lista de
e-mail scrapy-users](https://groups.google.com/forum/#!forum/scrapy-users).


## Introdução a web scraping com Scrapy

### O que é Scrapy?

[Scrapy](http://scrapy.org/) é um framework para crawlear web sites e extrair dados estruturados que
podem ser usados para uma gama de aplicações úteis (data mining, arquivamento,
etc).

*Scraping:*
: extrair dados do conteúdo da página

*Crawling:*
: seguir links de uma página a outra

Se você já fez extração de dados de páginas Web antes em Python, são grandes as
chances de você ter usado algo como requests + beautifulsoup. Essas tecnologias
ajudam a fazer *scraping*.

A grande vantagem de usar Scrapy é que tem suporte de primeira classe a
*crawling*.

Por exemplo, ele permite configurar o tradeoff de **politeness vs speed** (sem
precisar escrever código pra isso) e já vem com uma configuração útil de
fábrica para crawling habilitada: suporte a cookies, redirecionamento tanto via
HTTP header quanto via tag HTML `meta`, tenta de novo requisições que falham,
evita requisições duplicadas, etc.

Além disso, o framework é altamente extensível, permite seguir combinando
componentes e crescer um projeto de maneira gerenciável.

### Instalando o Scrapy

Recomendamos usar virtualenv, e instalar o Scrapy com:

    pip install scrapy

A dependência chatinha é normalmente o [lxml](http://lxml.de/) (que precisa de
algumas bibliotecas C instaladas). Caso tenha dificuldade, [consulte as
instruções específicas por
plataforma](http://doc.scrapy.org/en/latest/intro/install.html#intro-install-platform-notes)
ou peça ajuda nos canais citados acima.

Para verificar se o Scrapy está instalado corretamente, rode o comando:

    scrapy version

A saída que obtenho rodando este comando no meu computador é:

    $ scrapy version
    2015-11-14 19:58:56 [scrapy] INFO: Scrapy 1.0.3 started (bot: scrapybot)
    2015-11-14 19:58:56 [scrapy] INFO: Optional features available: ssl, http11
    2015-11-14 19:58:56 [scrapy] INFO: Overridden settings: {}
    Scrapy 1.0.3


### Rodando um spider

Para ter uma noção inicial de como usar o Scrapy, vamos começar rodando um
spider de exemplo.

Crie um arquivo **youtube_spider.py** com o seguinte conteúdo:


    import scrapy


    def first(sel, xpath):
        return sel.xpath(xpath).extract_first()


    class YoutubeChannelLister(scrapy.Spider):
        name = 'channel-lister'
        youtube_channel = 'portadosfundos'
        start_urls = ['https://www.youtube.com/user/%s/videos' % youtube_channel]

        def parse(self, response):
            for sel in response.css("ul#channels-browse-content-grid > li"):
                yield {
                    'link': response.urljoin(first(sel, './/h3/a/@href')),
                    'title': first(sel, './/h3/a/text()'),
                    'views': first(sel, ".//ul/li[1]/text()"),
                }


Agora, rode o spider com o comando:

    scrapy runspider youtube_spider.py -o portadosfundos.csv

O scrapy vai procurar um spider no arquivo **youtube_spider.py** e
escrever os dados no arquivo CSV **portadosfundos.csv**.

Caso tudo deu certo, você verá o log da página sendo baixada, os dados sendo
extraídos, e umas estatísticas resumindo o processo no final, algo como:

    ...
    2015-11-14 20:14:21 [scrapy] DEBUG: Crawled (200) <GET https://www.youtube.com/user/portadosfundos/videos> (referer: None)
    2015-11-14 20:14:22 [scrapy] DEBUG: Scraped from <200 https://www.youtube.com/user/portadosfundos/videos>
    {'views': u'323,218 views', 'link': u'https://www.youtube.com/watch?v=qSqPkRi-UiE', 'title': u'GAR\xc7ONS'}
    2015-11-14 20:14:22 [scrapy] DEBUG: Scraped from <200 https://www.youtube.com/user/portadosfundos/videos>
    {'views': u'1,295,054 views', 'link': u'https://www.youtube.com/watch?v=yXc8KCxyEyQ', 'title': u'SUCESSO'}
    2015-11-14 20:14:22 [scrapy] DEBUG: Scraped from <200 https://www.youtube.com/user/portadosfundos/videos>
    {'views': u'1,324,448 views', 'link': u'https://www.youtube.com/watch?v=k9CbDcOT1e8', 'title': u'BIBLIOTECA'}
    ...
    {'downloader/request_bytes': 239,
     'downloader/request_count': 1,
     'downloader/request_method_count/GET': 1,
     'downloader/response_bytes': 27176,
     'downloader/response_count': 1,
     'downloader/response_status_count/200': 1,
     'item_scraped_count': 30,
    ...
    2015-11-14 20:14:22 [scrapy] INFO: Spider closed (finished)

Ao final, verifique os resultados abrindo o arquivo CSV no seu editor de
planilhas favorito.

Se você quiser os dados em JSON, basta mudar a extensão do arquivo de saída:

    scrapy runspider youtube_spider.py -o portadosfundos.json

Outro formato interessante que o Scrapy suporta é [JSON lines](http://jsonlines.org):

    scrapy runspider youtube_spider.py -o portadosfundos.jl

Esse formato usa um item JSON em cada linha -- isso é muito útil para arquivos
grandes, porque fica fácil de concatenar dois arquivos ou acrescentar novas
entradas a um arquivo já existente.


## Conceitos do Scrapy

## Spiders

Conceito central no Scrapy,
[spiders](http://doc.scrapy.org/en/latest/topics/spiders.html) são classes que
herdam de
[``scrapy.Spider``](http://doc.scrapy.org/en/latest/topics/spiders.html#scrapy-spider),
definindo de alguma maneira as requisições iniciais do crawl e como proceder
para tratar os resultados dessas requisições.

Um exemplo simples de spider é:

    import scrapy

    class SpiderSimples(scrapy.Spider):
        name = 'meuspider'

        def start_requests(self):
            return [scrapy.Request('http://example.com')]

        def parse(self, response):
            self.log('Visitei o site: %s' % response.url)

Se você rodar o spider acima com o comando ``scrapy runspider``, deverá ver no
log as mensagens:

    2015-11-14 21:11:13 [scrapy] DEBUG: Crawled (200) <GET http://example.com> (referer: None)
    2015-11-14 21:11:13 [meuspider] DEBUG: Visitei o site: http://example.com

Como iniciar um crawl a partir de uma lista de URLs é uma tarefa comum,
o Scrapy permite você usar o atribute de classe `start_urls` em vez de
definir o método ``start_requests()`` a cada vez:

    import scrapy

    class SpiderSimples(scrapy.Spider):
        name = 'meuspider'
        start_urls = ['http://example.com']

        def parse(self, response):
            self.log('Visitei o site: %s' % response.url)

## Callbacks e próximas requisições

Repare o método ``parse()``, ele recebe um objeto *response* que representa uma
resposta HTTP, é o que chamamos de um **callback**. Os métodos **callbacks** no
Scrapy são
[generators](https://pythonhelp.wordpress.com/2012/09/03/generator-expressions/)
(ou retornam uma lista ou iterável) de objetos que podem ser:

* dados extraídos (dicionários Python ou objetos que herdam de scrapy.Item)
* requisições a serem feitas a seguir (objetos scrapy.Request)

O motor do Scrapy itera sobre os objetos resultantes dos callbacks e os
encaminha para o pipeline de dados ou para a fila de próximas requisições a
serem feitas.

Exemplo:

    import scrapy

    class SpiderSimples(scrapy.Spider):
        name = 'meuspider'
        start_urls = ['http://example.com']

        def parse(self, response):
            self.log('Visitei o site: %s' % response.url)
            yield {'url': response.url, 'tamanho': len(response.body)}

            proxima_url = 'http://www.google.com.br'
            self.log('Agora vou para: %s' % proxima_url)
            yield scrapy.Request(proxima_url, self.handle_google)

        def handle_google(self, response):
            self.log('Visitei o google via URL: %s' % response.url)


Antes de rodar o código acima, experimente ler o código e prever
o que ele vai fazer. Depois, rode e verifique se ele fez mesmo
o que você esperava.

Você deverá ver no log algo como:

    2015-11-14 21:32:53 [scrapy] DEBUG: Crawled (200) <GET http://example.com> (referer: None)
    2015-11-14 21:32:53 [meuspider] DEBUG: Visitei o site: http://example.com
    2015-11-14 21:32:53 [scrapy] DEBUG: Scraped from <200 http://example.com>
    {'url': 'http://example.com', 'tamanho': 1270}
    2015-11-14 21:32:53 [meuspider] DEBUG: Agora vou para: http://www.google.com.br
    2015-11-14 21:32:53 [scrapy] DEBUG: Crawled (200) <GET http://www.google.com.br> (referer: http://example.com)
    2015-11-14 21:32:54 [meuspider] DEBUG: Visitei o google via URL: http://www.google.com.br
    2015-11-14 21:32:54 [scrapy] INFO: Closing spider (finished)


### Settings

Outro conceito importante do Scrapy são as **settings** (isto é, configurações).
As **settings** oferecem uma maneira de configurar componentes do Scrapy, podendo
ser setadas de várias maneiras, tanto via linha de comando, variáveis de ambiente
em um arquivo **settings.py** no caso de você estar usando um projeto Scrapy ou ainda
diretamente no spider definindo um atributo de classe `custom_settings`.

Exemplo setando no código do spider um delay de 1.5 segundos entre cada
requisição:

    class MeuSpider(scrapy.Spider):
        name = 'meuspider'

        custom_settings = {
            'DOWNLOAD_DELAY': 1.5,
        }

Para setar uma setting diretamente na linha de comando com `scrapy runspider`,
use opção `-s`:

    scrapy runspider meuspider.py -s DOWNLOAD_DELAY=1.5

Uma setting útil durante o desenvolvimento é a *HTTPCACHE_ENABLED*, que
habilita uma cache das requisições HTTP -- útil para evitar baixar as
mesmas páginas várias vezes enquanto você refina o código de extração.

> **Dica:** na versão atual do Scrapy, a cache por padrão só funciona caso você
> esteja dentro de um projeto, que é onde ele coloca um diretório
> `.scrapy/httpcache` para os arquivos de cache. Caso você queira usar a cache
> rodando o spider com `scrapy runspider`, você pode usar um truque "enganar" o
> Scrapy criando um arquivo vazio com o nome `scrapy.cfg` no diretório atual, e
> o Scrapy criará a estrutura de diretórios `.scrapy/httpcache` no diretório
> atual.

Bem, por ora você já deve estar familiarizado com os conceitos importantes do
Scrapy, está na hora de partir para exemplos mais realistas.


## Hands-on: crawler para versões diferentes dum site de citações

Vamos agora criar um crawler para um site de frases e citações, feito
para esse tutorial e disponível em: <http://spidyquotes.herokuapp.com>

> *Nota:* O código-fonte do site está disponível em:
> <https://github.com/eliasdorneles/spidyquotes>

### Descrição dos objetivos:

O site contém uma lista de citações com autor e tags, paginadas com 10 citações
por páginas. Queremos obter todas as citações, juntamente com os respectivos
autores e lista de tags.

Existem 4 variações do site, com o mesmo conteúdo mas usando markup HTML diferente.

* Versão com markup HTML semântico: <http://spidyquotes.herokuapp.com/>
* Versão com leiaute em tabelas: <http://spidyquotes.herokuapp.com/tableful/>
* Versão com os dados dentro do código Javascript: <http://spidyquotes.herokuapp.com/js/>
* Versão com AJAX e scroll infinito: <http://spidyquotes.herokuapp.com/scroll>

Para ver as diferenças entre cada versão do site, acione a opção "Exibir
código-fonte" (<kbd>Ctrl</kbd>-<kbd>U</kbd>) do menu de contexto do seu
browser.

> **Nota:** cuidado com a opção "Inspecionar elemento" do browser para inspecionar
> a estrutura do markup. Diferentemente do resultado da opção "Exibir
> código-fonte" Usando essa ferramenta, o código que você vê representa as
> estruturas que o browser cria para a página, e nem sempre mapeiam diretamente
> ao código HTML que veio na requisição HTTP (que é o que você obtém quando usa
> o Scrapy), especialmente se a página estiver usando Javascript ou AJAX. Outro
> exemplo é o elemento `<tbody>` que é adicionado automaticamente pelos
> browsers em todas as tabelas, mesmo quando não declarado no markup.


### Spider para a versão com HTML semântico

Para explorar a página (e a API de scraping do Scrapy), você pode usar
o comando `scrapy shell URL`:

    scrapy shell http://spidyquotes.herokuapp.com/

Esse comando abre um shell Python (ou [IPython](http://ipython.org), se você o
tiver instalado no mesmo virtualenv) com o objeto `response`, o mesmo que você
obteria num método **callback**. Recomendo usar o IPython porque fica mais fácil
de explorar as APIs sem precisar ter que abrir a documentação a cada vez.

Exemplo de exploração com o shell:

    >>> # olhando o fonte HTML, percebi que cada citação está num <div class="quote">
    >>> # vamos pegar o primeiro dele, e ver como extrair o texto:
    >>> quote = response.css('.quote')[0]
    >>> quote
        <Selector xpath=u"descendant-or-self::*[@class and contains(concat(' ', normalize-space(@class), ' '), ' quote ')]" data=u'<div class="quote" itemscope itemtype="h'>
    >>> print quote.extract()
    <div class="quote" itemscope itemtype="http://schema.org/CreativeWork">
            <span itemprop="text">“We accept the love we think we deserve.”</span>
            <small itemprop="author">Stephen Chbosky</small>
            <div class="tags">
                Tags:
                <meta itemprop="keywords" content="inspirational,love"> 
                
                <a href="/tag/inspirational/page/1/">inspirational</a>
                
                <a href="/tag/love/page/1/">love</a>
                
            </div>
        </div>
    >>> print quote.css('span').extract_first()
    <span itemprop="text">“We accept the love we think we deserve.”</span>
    >>> print quote.css('span::text').extract_first()  # texto
    “We accept the love we think we deserve.”
    >>> quote.css('small::text').extract_first()  # autor
        u'Stephen Chbosky'
    >>> 
    >>> # para a lista de tags, usamos .extract() em vez de .extract_first()
    >>> quote.css('.tags a::text').extract()
        [u'inspirational', u'love']
    >>> 


Com o resultado da exploração inicial acima, podemos começar escrevendo um
spider assim, num arquivo `quote_spider.py`:

    import scrapy


    class QuotesSpider(scrapy.Spider):
        name = 'quotes'
        start_urls = [
            'http://spidyquotes.herokuapp.com/'
        ]

        def parse(self, response):
            for quote in response.css('.quote'):
                yield {
                    'texto': quote.css('span::text').extract_first(),
                    'autor': quote.css('small::text').extract_first(),
                    'tags': quote.css('.tags a::text').extract(),
                }

Se você rodar esse spider com:

    scrapy runspider quote_spider.py -o quotes.csv

Você obterá os dados das citações da primeira página no arquivo `quotes.csv`.
Só está faltando agora seguir o link para a próxima página, o que você também
pode descobrir com mais alguma exploração no shell:

    >>> response.css('li.next')
        [<Selector xpath=u"descendant-or-self::li[@class and contains(concat(' ', normalize-space(@class), ' '), ' next ')]" data=u'<li class="next">\n                <a hre'>]
    >>> response.css('li.next a')
        [<Selector xpath=u"descendant-or-self::li[@class and contains(concat(' ', normalize-space(@class), ' '), ' next ')]/descendant-or-self::*/a" data=u'<a href="/page/2/">Next <span aria-hidde'>]
    >>> response.css('li.next a::attr("href")').extract_first()
        u'/page/2/'
    >>> # o link é relativo, temos que joinear com a URL da resposta:
    >>> response.urljoin(response.css('li.next a::attr("href")').extract_first())
        u'http://spidyquotes.herokuapp.com/page/2/'

Juntando isso com o spider, ficamos com:

    import scrapy


    class QuotesSpider(scrapy.Spider):
        name = 'quotes'
        start_urls = [
            'http://spidyquotes.herokuapp.com/'
        ]

        def parse(self, response):
            for quote in response.css('.quote'):
                yield {
                    'texto': quote.css('span::text').extract_first(),
                    'autor': quote.css('small::text').extract_first(),
                    'tags': quote.css('.tags a::text').extract(),
                }
            link_next = response.css('li.next a::attr("href")').extract_first()
            if link_next:
                yield scrapy.Request(response.urljoin(link_next))

Agora, se você rodar esse spider novamente com:

    scrapy runspider quote_spider.py

Perceberá que ainda assim ele vai extrair apenas os items da primeira página, e a segunda página
vai falhar com um código HTTP 429, com a seguinte mensagem no log:

    2015-11-15 00:06:15 [scrapy] DEBUG: Crawled (429) <GET http://spidyquotes.herokuapp.com/page/2/> (referer: http://spidyquotes.herokuapp.com/)
    2015-11-15 00:06:15 [scrapy] DEBUG: Ignoring response <429 http://spidyquotes.herokuapp.com/page/2/>: HTTP status code is not handled or not allowed
    2015-11-15 00:06:15 [scrapy] INFO: Closing spider (finished)

<center>
  ![](http://httpstatusdogs.com/wp-content/uploads/2011/12/429.jpg)
</center>

O status HTTP 429 é usado para indicar que o servidor está recebendo muitas
requisições do mesmo cliente num curto período de tempo.

No caso do nosso site, podemos simular o problema no próprio browser se
apertarmos o botão atualizar várias vezes no mesmo segundo:

<center>
  ![](http://i.imgur.com/V3arr9E.jpg)
</center>

Neste caso, a mensagem no próprio site já nos diz o problema e a solução: o máximo de
requisições permitido é uma a cada segundo, então podemos resolver o problema setando
a configuração `DOWNLOAD_DELAY` para 1.5, deixando uma margem decente para podermos
fazer crawling sabendo que estamos respeitando a política.

Como esta é uma necessidade comum para alguns sites, o Scrapy também permite
você configurar este comportamento diretamente no spider, setando o atributo de
classe `download_delay`:

    import scrapy


    class QuotesSpider(scrapy.Spider):
        name = 'quotes'
        start_urls = [
            'http://spidyquotes.herokuapp.com/'
        ]
        download_delay = 1.5

        def parse(self, response):
            for quote in response.css('.quote'):
                yield {
                    'texto': quote.css('span::text').extract_first(),
                    'autor': quote.css('small::text').extract_first(),
                    'tags': quote.css('.tags a::text').extract(),
                }
            link_next = response.css('li.next a::attr("href")').extract_first()
            if link_next:
                yield scrapy.Request(response.urljoin(link_next))

### Usando extruct para microdata

Se você é um leitor perspicaz, deve ter notado que o markup HTML tem umas
marcações adicionais ao HTML normal, usando atributos `itemprop` e `itemtype`.
Trata-se de um mecanismo chamado
[Microdata](https://en.wikipedia.org/wiki/Microdata_(HTML)), [especificado pela
W3C](http://www.w3.org/TR/microdata/) e feito justamente para facilitar a
tarefa de extração automatizada. Vários sites suportam este tipo de marcação,
alguns exemplos famosos são [Yelp](http://www.yelp.com), [The
Guardian](http://www.theguardian.co.uk), [LeMonde](http://lemonde.fr), etc.

Quando um site tem esse tipo de marcação para o conteúdo que você está
interessado, você pode usar o extrator de microdata da biblioteca
[extruct](https://pypi.python.org/pypi/extruct).

Instale a biblioteca extruct com:

    pip install extruct

Veja como fica o código usando a lib:

    import scrapy
    from extruct.w3cmicrodata import LxmlMicrodataExtractor


    class QuotesSpider(scrapy.Spider):
        name = "quotes-microdata"
        start_urls = ['http://spidyquotes.herokuapp.com/']
        download_delay = 1.5

        def parse(self, response):
            extractor = LxmlMicrodataExtractor()
            items = extractor.extract(response.body_as_unicode(), response.url)['items']

            for it in items:
                yield it['properties']

            link_next = response.css('li.next a::attr("href")').extract_first()
            if link_next:
                yield scrapy.Request(response.urljoin(link_next))

Usando microdata você reduz sobremaneira os problemas de mudanças de leiaute,
pois o desenvolvedor do site ao colocar o markup microdata se compromete a
mantê-lo atualizado.

### Lidando com leiaute de tabelas:

Agora, vamos extrair os mesmos dados mas para um markup faltando bom-gosto:
<http://spidyquotes.herokuapp.com/tableful/>

A dica para lidar com esse tipo de coisa é: **aprenda XPath**, vale a pena!

Comece aqui: <http://www.slideshare.net/scrapinghub/xpath-for-web-scraping>

> *O domínio de XPath diferencia os gurus dos gafanhotos. -- Elias Dorneles, 2014*

Como o markup HTML dessa página não uma estrutura boa, em vez de fazer scraping
baseado nas classes CSS ou ids dos elementos, com XPath podemos fazer baseando-se
na estrutura e nos padrões presentes no conteúdo.

Por exemplo, se você abrir o shell para a página
<http://spidyquotes.herokuapp.com/tableful>, usando a expressão a seguir
retorna os os nós `tr` (linhas da tabela) que contém os textos das citações,
usando uma condição para pegar apenas linhas que estão imediatamente antes de
linhas cujo texto comece com `"Tags: "`:

    >>> response.xpath('//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]')
    [<Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>,
     <Selector xpath='//tr[./following-sibling::tr[1]/td[starts-with(., "Tags:")]]' data=u'<tr style="border-bottom: 0px; ">\n      '>]

O código final do spider ficará:

TODO: código do spider aqui.


### Lidando com dados dentro do código

A dica aqui é usar a lib [js2xml](https://github.com/redapple/js2xml) para
converter o código Javascript em XML e então usar XPath ou CSS em cima desse
código para extrair os dados que você está interessado.

Instale a biblioteca js2xml com:

    pip install js2xml

Veja como fica o código:

TODO: colocar código do spider com js2xml aqui


### Lidando com AJAX

Dica: usar a aba Network do browser, usar Copy as cURL e `minreq --action print_scrapy_request`.

TODO: colocar código final do spider aqui.


## Rodando no Scrapy Cloud

O [Scrapy Cloud](http://scrapinghub.com/platform/) é a plataforma PaaS para
rodar crawlers na nuvem, o que permite evitar uma série de preocupações com
infraestrutura.

Funciona como um "Heroku para crawlers", você faz deploy do seu projeto Scrapy
e configura jobs para rodar spiders periodicamente.  Você pode também
configurar scripts Python para rodar periodicamente, os quais podem gerenciar o
escalonamento dos spiders.

Comece criando uma conta free forever em: <http://try.scrapinghub.com/free>

### Criação do projeto

Até aqui nossos exemplos foram simplesmente rodando spiders com `scrapy runspider`.
Para fazer o deploy, chegou a hora de criar um projeto Scrapy propriamente dito.

Para criar um projeto, basta rodar o comando `scrapy startproject` passando o nome do projeto:

    scrapy startproject quotes_crawler

Feito isso, entre no diretório do projeto com `cd quotes_crawler` e copie os
arquivos com spiders para dentro do diretório `quotes_crawler/spiders`.
Certifique-se de usar um nome único para cada spider.

A partir desse momento, você deve ser capaz de rodar cada spider em separado usando o comando:

    scrapy crawl NOME_DO_SPIDER

> **Nota:** Dependendo do caso, é legal começar com um projeto desde o começo,
> para já fazer tudo de maneira estruturada. Pessoalmente, eu gosto de começar
> com spiders em arquivos soltos, quando estou apenas testando a viabilidade de
> um crawler. Crio um projeto apenas quando vou colaborar no código com outras
> pessoas ou fazer deploy no Cloud, nessa hora já é interessante que fique tudo
> estruturado e fácil de crescer dentro de um projeto.

### Deploy do projeto

Antes do deploy, você precisa criar um projeto no Scrapy Cloud. Na tela
inicial, clique no botão adicionar uma organização:

<center>
  ![](http://imgur.com/9fsBv4I)
</center>

Dê um nome para a organização e confirme:

<center>
  ![](http://imgur.com/GvfEXzu)
</center>

Em seguida, adicione um serviço do para hospedar o seu serviço, clicando no
botão "+ Service" que aparece dentro da organização criada:

<center>
  ![](http://imgur.com/D0VTJLc)
</center>

Preencha os dados do seu projeto e confirme:

<center>
  ![](http://imgur.com/05Hvbu3)
</center>

Depois disso, clique no nome do serviço na página inicial para acessar o local
onde seu projeto estará disponível:

<center>
  ![](http://imgur.com/OIZLxYA)
</center>

Note o número identificador do seu projeto: você deve usar esse número
para a diretiva `project_id` no arquivo `scrapy.cfg` dentro do seu projeto
para fazer o deploy.

<center>
  ![](http://imgur.com/ErsMJbB)
</center>

TODO: mostrar scrapy.cfg

A maneira mais fácil de fazer deploy no Scrapy Cloud é usando a ferramenta
[shub](http://doc.scrapinghub.com/shub.html). Instale-a com:

    pip install shub --upgrade

Faça login com o shub, usando o comando:

    shub login

Informe sua API key conforme for solicitado ([descubra aqui sua API
key](https://dash.scrapinghub.com/account/apikey)).

> **Dica:** Ao fazer login, o shub criará no arquivo `~/.netrc` uma entrada
> configurada para usar sua API key.  Esse arquivo também é usado pelo `curl`,
> o que é útil para quando você deseje fazer requisições HTTP para as APIs na
> linha de comando.

Agora faça deploy do projeto com o comando:

    shub deploy

Se tudo deu certo, você verá a mensagem:

TODO: colar mensagem de sucesso

### Configurar spider para rodar periodicamente

TODO: screenshot
