# Learn Phoenix (Web App) Framework

![phoenix framework logo](https://cloud.githubusercontent.com/assets/194400/22605039/2065bca4-ea46-11e6-93f9-c927218784a9.png)

Learn how to use Phoenix (_the most **productive** web application_) Framework
to build apps<br />
that are a joy to _use_ and work on, ***fast***,
***reliable***, ***scalable*** and ***maintainable***!

## _Why_?

As web application developers we _need_ to _leverage_
the work that other (_really smart_) people have done
instead of building things "_from scratch_" all the time.

The "original"


### But Phoenix is not "_Mainstream_" ... Should I _use_ it?

There are _many_ web application frameworks you/we can choose from:
https://en.wikipedia.org/wiki/Comparison_of_web_frameworks <br />
So _why_ would _anyone_ select a framework written in a programming language
that is not "_mainstream_"...?


> "_**Elixir** provides the **joy** and **productivity** of Ruby <br />
with the **concurrency** and **fault-tolerance** of **Erlang**_."




## _What_?

A web application framework that without compromise!

> Read more: http://www.phoenixframework.org/

### Video Intro by José Valim (_Creator of Elixir_)

[![Jose Valim - Phoenix a web framework for the new web](https://cloud.githubusercontent.com/assets/194400/22608108/e34aefbc-ea52-11e6-8694-9ac13c36db47.png)](https://youtu.be/MD3P7Qan3pw "Click to watch!") <br />
https://youtu.be/MD3P7Qan3pw

[![ElixirConf 2016 - Keynote by José Valim](https://cloud.githubusercontent.com/assets/194400/22608199/743b69d4-ea53-11e6-8153-e6655fc64453.png)](https://youtu.be/srtMWzyqdp8 "Click to watch!") <br />
https://youtu.be/srtMWzyqdp8


## _How_?

_Familiarize_ yourself with: http://www.phoenixframework.org/docs/up-and-running

 > TODO: add a _basic but practical_ tutorial here ... `help wanted`

Meanwhile, we recommend that people buy (_or **borrow**_) the book:
![phoenix](https://cloud.githubusercontent.com/assets/194400/22609006/33e03f96-ea57-11e6-97b3-f0606998400d.png)

https://pragprog.com/book/phoenix/programming-phoenix
it's written by @chrismccord who _created_ Phoenix.  <br />
(_i.e: it's the obvious choice for how to learn Phoenix!_)



## tl;dr

### Do I _need_ to learn Elixir `before` trying/using Phoenix?

***Yes***. See: https://github.com/dwyl/learn-elixir

### Do I Need to _know_ Erlang to use Elixir & Phoenix...?

***No***. You can start learning/using Elixir _today_ and
call Erlang functions when required, <br />
but you ***don't need*** to know Erlang
`before` you can use Phoenix!

### Why are we not using Hapi.js _anymore_...?

This is _missinformation_. We _are_ still using Hapi.js
for a _number_ of projects where it is _appropriate_. <br />
This includes _several_ client projects and internal dwyl apps/tools.

We _decided_ to use Phoenix for our _new_ projects for these simple reasons:
+ Elixir is a _nicer_ language than JavaScript.
`#LessIsMore` `#LessButBetter` `#SmallIsBeautiful` `#SyntaxMatters`
+ JS _can_ be functional, whereas Elixir ***is*** (_always_) Functional!
The _distinction_ makes all the difference! <br />
With "functional" programming,
the programs are a ***lot*** easier to think about
while you are writing/maintaining them!
+ Elixir uses the Erlang VM which is _way_ more efficient/powerful than "V8"
+ The Erlang VM scales _much easier_ to multi-core multi-server multi-data-center
than Node.js <br />
(_or pretty much anything else for that matter!!_)

> _For our new projects we **need multi-data-center fault-tolerance**! <br />
we get that "**for free**" by using **Erlang -> Elixir -> Phoenix**_!!

In our _opinion_ Hapi.js is still "_the best_" Node.js framework and
we will `continue` to use and _recommend_ it <br />
to people that need _simple_ apps that scale and are easy to maintain. <br />
see: https://github.com/dwyl/learn-hapi

Also we still use JavaScript for all our AWS Lambda Micro-Services,
that is not going to change. <br />
They are simple, efficient and
scale really well!  <br />
see: https://github.com/dwyl/learn-aws-lambda

### Why _not_ Use Scala and `Play` Framework _instead_...?

If you are already used to writing Java or deploying to the JVM,
the Play Framework is a _superb_ choice: https://www.playframework.com <br />
Scala is a _good_ programming language and everyone should learn it!
https://www.scala-lang.org/what-is-scala.html <br />

> We have used Play a few times (_before we adopted Node.js_)
and _really_ liked it! <br />
But Scala is a "kitchen sink" (_multi-paradigm_)
programming language that allows people to use "_all of Java_" ... <br />
We think Scala's "Java Interoperability" means it's "too easy" to allow
***complexity*** into your codebase. Specifically ["OOP Mutation"](http://docs.scala-lang.org/overviews/collections/overview.html) ...

So why _aren't_ we (DWYL) using "Play" for _new_ projects any more?
Firstly, we transitioned to Hapi.js (_Node.js_) a _few_ years ago
because it was more "***lightweight***" and allowed us to write _tiny_ programs
that used only a few Megs of RAM
(_where our Play apps were very resource-hungry..!
  have you ever tried running a Scala app
  on a "basic" laptop like a Chromebook...?_)

Summary of "reasons" for Phoenix instead of Play:
+ We maintain that Play/Scala still has plenty of valid use-cases.
+ Elixir is _way_ simpler than Scala. <br />
+ The Erlang VM is _way_ better at ***concurrency*** than the JVM.
+ We ***love*** the fact that all data is immutable in Elixir.
+ We ***love*** how few resources it takes to run a Phoenix app
(_e.g on a Raspberry Pi!!_)

> _We just think that for **our** project(s) ***Erlang's Concurrency model***
**works better** and **Functional code** transforming **Immutable data**
is **easier** to test and maintain_.

If you have _evidence_ that "_Scala is Simpler_"
we would _love_ to hear from you! <br />
Tell us: https://github.com/dwyl/learn-phoenix-web-development/issues
