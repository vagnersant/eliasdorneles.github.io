Title: Programando Erlang - 1 de Any
Date: 2014-04-05 23:35
Author: elias
Slug: Programando-Erlang---1-de-Any

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Na
virada do ano, uma das minhas resoluções para 2014 foi a de que este ano
aprenderia</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Erlang</span>](http://www.erlang.org/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
Eu queria brincar com alguma linguagem que usasse ideias diferentes das
que uso no trabalho e que me ensinasse mais do que simplesmente outro
jeito de escrever os programas que já sei.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Como
eu gostei de ler as ideias do</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Joe
Armstrong</span>](http://joearms.github.io/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
no livro</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Coders
at Work</span>](http://www.codersatwork.com/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
e as</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">descrições
de
Erlang</span>](http://en.wikipedia.org/wiki/Erlang_(programming_language))<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
na Internet me deixaram curioso, resolvi que em 2014 eu iria aprender
Erlang. E assim, decidi por comprar logo o livro</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Programming
Erlang</span>](http://pragprog.com/book/jaerlang2/programming-erlang)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
escrito pelo próprio Joe, e tentar aprender por ele.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Ainda
não terminei de ler o livro, estou curtindo o aprendizado, acho que foi
uma boa escolha de linguagem “extra” pra aprender. Mas como o livro fala
sobre bastante coisa, resolvi escrever alguma coisa logo porque se
deixar para escrever sobre o livro inteiro a tarefa vai ficar grande
demais e eu vou fugir correndo com medo dela.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Então...
Erlang!</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">É
uma linguagem divertida. =)</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Erlang
é uma linguagem funcional com tipagem dinâmica, de propósito geral,
focada em facilitar o desenvolvimento de programas concorrentes e que
roda em uma máquina virtual própria (também chamada</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">BEAM</span>](http://www.erlang-factory.com/upload/presentations/708/HitchhikersTouroftheBEAM.pdf)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Mas
Erlang é mais do que uma linguagem, podemos dizer que Erlang é todo um
ambiente diferente. A VM de Erlang lembra um sistema operacional em
muitas formas, possuindo seu próprio shell, seu próprio gerenciador de
processos, seu esquema de atualização sem precisar parar nenhum processo
e seus</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">mecanismos
disponíveis para comunicação entre
processos</span>](http://pt.wikipedia.org/wiki/Comunica%C3%A7%C3%A3o_entre_processos)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Um
processo Erlang não é nem um processo do sistema operacional nem uma
thread: é um</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">processo
leve</span>](http://en.wikipedia.org/wiki/Erlang_(programming_language)#Concurrency_and_distribution_orientation)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
muito mais leve que threads. A criação de um novo processo é
praticamente gratuita -- pode-se dizer que criar um novo processo em
Erlang é tão comum e tão sossegado quanto instanciar um novo objeto em
Java.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Em
Erlang, é idiomático encapsular funcionalidade em processos, e é comum
um sistema ter milhares desses processos concorrentes, cada um com sua
responsabilidade. Assim, esses processos encapsulando funcionalidades
são análogos a</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">serviços
em uma arquitetura orientada a
serviços</span>](http://en.wikipedia.org/wiki/Service_(systems_architecture))<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
só que em Erlang eles aparecem numa forma bem natural na linguagem e
mais integrada ao ambiente.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Aqui,
permita-me apresentar algumas coisinhas da linguagem pra você, bem
rapidão. Para acompanhar,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">instale
Erlang</span>](http://www.erlang.org/download.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(no Ubuntu:</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">sudo
apt-get install erlang</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**  

<span style="background-color: transparent; color: black; font-family: 'Trebuchet MS'; font-size: 17px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Super-quick-little-taste-of-Erlang</span> {dir="ltr" style="line-height: 1.15; margin-bottom: 0pt; margin-top: 10pt;"}
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Veja
o seguinte esqueleto de um programa concorrente em Erlang:</span>

</div>

**  
**

<div class="separator" style="clear: both; text-align: center;">

</div>

<div class="separator" style="clear: both; text-align: center;">

[![](http://2.bp.blogspot.com/-HmS5hqh97EA/U0D7Y5iIeII/AAAAAAAAAtk/SVLNHGSIVHk/s1600/erlang-loop-menor.png)](http://2.bp.blogspot.com/-HmS5hqh97EA/U0D7Y5iIeII/AAAAAAAAAtk/SVLNHGSIVHk/s1600/erlang-loop-menor.png)

</div>

<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">Note
a recursão na função</span><span
style="color: black; font-family: Arial; font-size: 15px; font-style: italic; vertical-align: baseline; white-space: pre-wrap;">loop</span><span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">:
é assim que se faz processos iterativos (loops) em Erlang, que não tem
sintaxe especial para isso. O compilador implementa a otimização de
“</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">recursão
de
cauda</span>](http://pt.wikipedia.org/wiki/Recursividade_(ci%C3%AAncia_da_computa%C3%A7%C3%A3o)#Fun.C3.A7.C3.B5es_recursivas_em_cauda)<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">”
(</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">tail
recursion</span>](http://en.wikipedia.org/wiki/Tail_call)<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">)
para fazer uma função escrita de maneira recursiva executar de forma
iterativa  -- isto é, sem re-chamar a função aumentando a</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">pilha
de chamada</span>](http://pt.wikipedia.org/wiki/Pilha_de_chamada)<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">
(</span>[<span
style="color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">call
stack</span>](http://en.wikipedia.org/wiki/Call_stack)<span
style="color: black; font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;">).</span>  
**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Você
pode testar esse código colocando-o em um arquivo</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">esqueleto.erl</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
e chamá-lo do shell Erlang, conforme a sessão abaixo (comandos digitados
estão em negrito):</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">erl</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Erlang R16B01
(erts-5.10.2) [source] [64-bit] [smp:4:4] [async-threads:10]
[kernel-poll:false]</span></span>

</div>

**<span style="font-family: Courier New, Courier, monospace;">  
<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Eshell V5.10.2
 (abort with \^G)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">c(esqueleto).</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">{ok,esqueleto}</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
= esqueleto:start().</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\<0.41.0\></span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
! "alo!".</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Received:
"alo!"</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">"alo!"</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">4\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
! 1234.</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Received:
1234</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">1234</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">5\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
! {teste, com, uma, tupla, 123, "ola"}.</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Received:
{teste,com,uma,tupla,123,"ola"}</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">{teste,com,uma,tupla,123,"ola"}</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">6\></span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Note
os pontos finais no fim de cada comando: o comando não roda se você
esquecer deles. Em Erlang, o ponto (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
separa</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">comandos</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
e</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">declarações</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
o ponto-e-vírgula (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">;</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
separa</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">cláusulas</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
e a vírgula (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
separa</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">expressões</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A
primeira linha,</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">c(esqueleto).</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
manda compilar o módulo no arquivo</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">esqueleto.erl</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Na
segunda linha,</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
= esqueleto:start().</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
aciona a função</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">start()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
do módulo esqueleto, que vai gerar um novo processo e retornar o
identificador do processo (em inglês,</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">process
identifier</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),
que armazenamos na variável</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A
seguir, na terceira linha usamos o comando</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">!</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
para envio de mensagens em Erlang, enviando a mensagem</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">“alo!”</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
para o processo criado na linha anterior, identificado por</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
O comando</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">receive</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
da função</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">loop()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
vai receber a mensagem e executar o código que imprime a mensagem na
tela. A mensagem aparece repetida na tela porque o retorno do comando de
envio (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Pid
! Mensagem</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
é a mensagem enviada, e o shell sempre imprime o retorno do último
comando executado.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">As
linhas seguintes apenas repetem o mesmo feito da linha anterior, com
outras mensagens diferentes (um inteiro e uma tupla contendo átomos,
inteiros e strings).</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">O
comando</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">receive</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
tem algumas habilidades especiais: além de bloquear a execução do código
até o processo receber uma mensagem (que também pode ter um</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">timeout</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
definido), ele pode selecionar o bloco de código a ser executado
dependendo da forma ou conteúdo da mensagem, com o mecanismo chamado
de</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span>](http://en.wikipedia.org/wiki/Pattern_matching)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(ou,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">casamento
de
padrões</span>](http://pt.wikipedia.org/wiki/Casamento_de_padr%C3%B5es)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Por
exemplo, usando</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
podemos alterar o comando</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">receive</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
da função</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">loop()</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
para executar um código diferente caso receba a mensagem</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">“alo!”</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">loop()
-\></span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
   </span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">receive</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
       </span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"alo!"</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
-\></span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
           io:format(</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"Alooooow,
galerinha da paaishhh!"</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">
           loop();</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">        Any
-\></span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
           io:format(</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">"Received:
\~p\~n"</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
[Any]),</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">
           loop()</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
   </span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">end</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Se
você repetir os passos anteriores com esse novo código, receberá uma
resposta mais animada quando enviar a mensagem</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">“alo!”</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Nesse
exemplo, o padrão casado foi o conteúdo da mensagem, isto é, a string
“alo!”. Mas o mecanismo permite fazer vários tipos de verificações: você
pode, por exemplo, verificar se a mensagem é um número ou uma tupla, se
é uma tupla contendo um determinado elemento, se é uma lista com tantos
elementos, etc.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Quando
alguém mais acostumado ao paradigma imperativo se depara com a ideia
de</span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(que existe em outras linguagens além de Erlang), usualmente acha
útil</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">pensar
nele como um “switch-case em
esteróides”</span>](http://stackoverflow.com/questions/2502354/what-is-pattern-matching-in-functional-languages)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
uma espécie de Super Estrutura Condicional.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Em
Erlang, todavia,</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(ou casamento de padrões) aparece em mais do que estruturas
condicionais.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">De
fato, na expressão:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">X
= 1.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">o</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">=</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(igual) é um acionamento do operador de</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
de Erlang -- diferente de outras linguagens em que o igual é um operador
de</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">atribuição</span>](http://pt.wikipedia.org/wiki/Atribui%C3%A7%C3%A3o_(computa%C3%A7%C3%A3o))<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
Erlang não tem operador atribuição, que usualmente permite definir e
redefinir o conteúdo de variáveis.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">O
que acontece aqui é que o</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">operador
de</span><span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">pattern
matching</span>](http://www.erlang.org/doc/reference_manual/patterns.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
liga um valor a uma variável quando esta ainda não tem nenhum valor
associado (isto é, quando se trata de uma</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">variável
livre</span>](http://pt.wikipedia.org/wiki/Vari%C3%A1veis_livres_e_ligadas)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
ou</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">unbound
variable</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Na
próxima vez que a variável for referenciada, ela terá o valor “casado”
(</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">matched</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
anteriormente, veja:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">1\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A.</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\* 1: variable 'A'
is unbound</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">2\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A="oi".</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">"oi"</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">3\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A.</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">"oi"</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">4\></span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Uma
vez ligada, a variável só casará com o valor original, e nunca mais com
outro. Caso tente casar a variável com outro valor (pensando que
funcionaria como atribuição), você obterá um erro avisando que falhou o
casamento do padrão:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">4\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A
= "alô".</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">\*\* exception
error: no match of right hand side value "alô"</span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Isto
porque em Erlang, as variáveis são imutáveis para o contexto local.
Outra forma de dizer é: em Erlang, as variáveis são de atribuição única
(</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">single
assignment variables</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).
Uma vez atribuído um valor a uma variável, você não pode alterá-lo --
como demonstrei acima.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Isto
parece estranho no começo, para quem está acostumado com o paradigma
imperativo. Pensando bem, é a mesma estranheza que a gente sente quando
aprende a programar e é exposto a variáveis e atribuição pela primeira
vez (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">“como
assim, x = x + 1?”</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">).
Faz mais sentido pensar nas variáveis de Erlang como as variáveis da
Matemática, em que o valor de um nome é sempre o mesmo.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">A
imutabilidade de variáveis tem como consequência algumas coisas
interessantes:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">força
    você a criar novas variáveis em algumas situações, mesmo que esteja
    com pouca criatividade para dar um nome decente (no livro mesmo tem
    alguns exemplos com</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Word1</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Word2</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    -- o que é meio feio)</span>

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">evita
    alguns tipos de</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">bugs</span><span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
    e simplifica a depuração, pois aumenta a previsibilidade da execução
    do código (isto é, você pode confiar que o valor de uma variável não
    vai mudar)</span>

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">facilita
    a escrita de programas concorrentes e permite que sejam rodados em
    paralelo, pois evita uma cacetada de problemas de memória
    compartilhada</span>

    </div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">E
esta última consequência compensa as dificuldades de dar nomes às
variáveis. Porque escrever programas</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">multi-thread</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
é difícil de fazer direito (você precisa se preocupar com</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">sincronização</span>](http://en.wikipedia.org/wiki/Synchronization_(computer_science))<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
de processos e de memória), e o jeito Erlang de escrever programas
concorrentes que se comunicam via envio de mensagens (o</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">modelo
de atores</span>](http://c2.com/cgi/wiki?ActorsModel)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
simplifica as coisas, de forma que os programas são sempre
paralelizáveis.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Isso
faz com que aplicações escritas em Erlang escalem mais fácil do que
aplicações escritas em outras linguagens. Claro que vários problemas de
escalabilidade se manterão, principalmente os relacionados a hardware e
infraestrutura, mas problemas de software tendem a ser resolvidos mais
fácil com Erlang.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">De
fato, Erlang vem de fábrica com mecanismos de clusterização, e você pode
facilmente iniciar nós de um cluster em algumas máquinas e disparar
chamadas remotas de um nó para outro.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Para
um exemplo rápido, inicie um nó do cluster em um terminal, dando um
nome:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">erl
-sname lennon@localhost</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Erlang R16B01
(erts-5.10.2) [source] [64-bit] [smp:4:4] [async-threads:10]
[kernel-poll:false]</span></span>

</div>

**<span style="font-family: Courier New, Courier, monospace;">  
<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Eshell V5.10.2
 (abort with \^G)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">(lennon@localhost)1\></span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Em
outro terminal, inicie outro nó e faça uma chamada remota ao nó
anterior:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">\$</span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">erl
-sname mccartney@localhost</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Erlang R16B01
(erts-5.10.2) [source] [64-bit] [smp:4:4] [async-threads:10]
[kernel-poll:false]</span></span>

</div>

**<span style="font-family: Courier New, Courier, monospace;">  
<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">Eshell V5.10.2
 (abort with \^G)</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span style="font-family: Courier New, Courier, monospace;"><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">(mccartney@localhost)1\></span><span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: bold; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">rpc:call(lennon@localhost,
file, list\_dir, ["/"]).</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">{ok,["var","tmp","mnt","lib","boot","lib32","vmlinuz",</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">
    "proc","media","bin","lib64","sys","opt","sbin","srv",</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">
    "root","dev","usr","initrd.img","lost+found","cdrom","home",</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">
    "vmlinuz.old","run","etc","initrd.img.old"]}</span></span>

</div>

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"><span
style="font-family: Courier New, Courier, monospace;">(mccartney@localhost)2\></span></span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">O
argumento</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">-sname</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
faz com que Erlang inicie um nó com o nome passado (note como o nome do
nó é mostrado no prompt). No comando que executamos no segundo nó
(</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">mccartney@localhost</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)
usamos a função</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">call</span><span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">
do módulo</span><span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">rpc</span>](http://erlang.org/doc/man/rpc.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
para acionar uma função remotamente em outro nó e obter o resultado --
neste caso, a função</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">os:listdir(“/”)</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
para retornar a lista de arquivos do diretório raiz.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">E
tudo com código da distribuição padrão. (</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Try
that in Java, biátch!</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">)</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Bom,
tentei mostrar algumas coisas interessantes da linguagem aqui, mas
Erlang tem muito a oferecer ainda. Ela tem outros</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">tipos
de dados
interessantes</span>](http://www.erlang.org/doc/reference_manual/data_types.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
(átomos,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">binaries</span>](http://www.erlang.org/doc/efficiency_guide/binaryhandling.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
tuplas,</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">records</span>](http://www.erlang.org/doc/reference_manual/records.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
e na</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">versão
R17</span>](http://www.erlang.org/news/67)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
terá</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">maps</span>](http://www.erlang.org/eeps/eep-0043.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">),
um</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">mecanismo
próprio de comunicação com outros processos do sistema
operacional</span>](http://www.erlang.org/doc/reference_manual/ports.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
permite a</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">especificação
opcional de tipos para
funções</span>](http://www.erlang.org/doc/reference_manual/typespec.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
um</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">banco
de dados para aplicações
distribuídas</span>](http://www.erlang.org/doc/man/mnesia.html)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
vem com ferramentas de fábrica para análise estática de código,
depuração e profiling e com um</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">conjunto
de bibliotecas e funções para aplicações tolerante a falhas e
distribuídas</span>](http://learnyousomeerlang.com/what-is-otp)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Só
tem dois problemas de usabilidade que me incomodam um pouco:</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Nem
    todos os comandos ou exemplos de código funcionam no shell. Algumas
    funcionalidades só estão disponíveis no shell, e outras apenas em
    módulos compilados (</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">criar
    funções no
    shell</span>](http://stackoverflow.com/questions/2065990/defining-erlang-functions-in-the-shell)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
    por exemplo). Isso é uma espécie de “bug conhecido”:</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Joe
    Armstrong, o criador da linguagem, conta que seus cabelos
    embranqueceram de tanto explicar por que a implementação ficou desse
    jeito</span>](http://joearms.github.io/2013/05/31/a-week-with-elixir.html)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.</span>

    </div>

-   <div dir="ltr"
    style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

    <span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">O
    shell não tem histórico persistente, e não suporta atalhos comuns em
    aplicações da linha de comando que usam a</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">GNU
    Readline</span>](http://en.wikipedia.org/wiki/GNU_Readline)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">.
    Parece que o esquema de IO do shell Erlang é meio complicado de
    manter -- no GitHub tem</span>[<span
    style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">um
    projeto que adiciona um histórico persistente
    básico</span>](https://github.com/ferd/erlang-history)<span
    style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">,
    mas o FAQ não é muito encorajador.</span>

    </div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">O
resto é fantástico. =)</span>

</div>

**  
<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;"></span>**

<div dir="ltr"
style="line-height: 1.15; margin-bottom: 0pt; margin-top: 0pt;">

<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Caso
você tenha ficado curioso, pode querer conferir o livro</span>[<span
style="background-color: transparent; color: #1155cc; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: underline; vertical-align: baseline; white-space: pre-wrap;">Learn
You Some Erlang</span>](http://learnyousomeerlang.com/)<span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
-- não li, mas já tirei algumas dúvidas nele caindo de buscas do Google
e pareceu muito bom.</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: italic; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">Have
a nice journey!</span><span
style="background-color: transparent; color: black; font-family: Arial; font-size: 15px; font-style: normal; font-variant: normal; font-weight: normal; text-decoration: none; vertical-align: baseline; white-space: pre-wrap;">
:)</span>

</div>

<span
style="font-family: Arial; font-size: 15px; vertical-align: baseline; white-space: pre-wrap;"></span><span
style="font-family: Arial; font-size: 15px; line-height: 1.15; white-space: pre-wrap;">Valeu
pela revisão, Fredi e Denise.</span>
