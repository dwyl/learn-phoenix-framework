# Learn Phoenix (Web App) Framework

![phoenix framework logo](https://cloud.githubusercontent.com/assets/194400/22605039/2065bca4-ea46-11e6-93f9-c927218784a9.png)

Learn how to use Phoenix Framework to
**have _fun_ building _real-time_ web/mobile apps** <br />
that are ***fast*** for "_end-users_", ***reliable***,
***scalable***, ***maintainable*** _and_ (_easily_) ***extensible***!

## _Why_?

As web/mobile app developers we _need_ to _leverage_
the work that other (_really smart_) people have done <br />
instead of building things "_from scratch_" all the time;
that is _why_ we build apps using _frameworks_.

There are _many_ frameworks to choose from
(_a **few** "popular" ones are mentioned **below**
in the "**Questions**" section_). <br />
But if we go by what is "_popular_" we would
still be riding horses (_and carts_) to work
and no _progress_ would be made. <br />

Phoenix is like having a
[***jetpack***](https://youtu.be/H0ftAwlAB9o) (_with **unlimited free environmentally-friendly fuel**_!!); <br />
it gets you (_your app_) to where you need to be ***so much faster***! <br />

_Seriously_, once you _deploy_ your first Phoenix app
_**you will feel** like you're **freakin' Iron** ~~Man~~ **Person**!_
![iron-man-flying](https://cloud.githubusercontent.com/assets/194400/22628358/9ca42c58-ebca-11e6-8729-bc0103284312.jpg)
You won't want to "_walk_" anywhere (_use a lesser means of web development_)
_ever again_!


## _What_?

A web application framework ***without compromise***! <br />

You can spend years and mountains of money
"_performance tuning_" an "_old car_" attempting to make it go _faster_ ...

Just like there is an _entire industry_ involved in "_tuning_"
"_average_" cars (_that weren't made for high performance!_)
there's a similar one for "_optimsing_"

(_e.g:
feeding it all the

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


## Resources

+ Elixir vs Ruby Showdown - Phoenix vs Rails: https://littlelines.com/blog/2014/07/08/elixir-vs-ruby-showdown-phoenix-vs-rails
+ Benchmark: https://github.com/mroth/phoenix-showdown

<br /><br /><br />



# _Questions_ ?

### Do I _need_ to learn Elixir `before` trying/using Phoenix?

***Yes***. See: https://github.com/dwyl/learn-elixir

### Do I Need to _know_ Erlang to use Elixir & Phoenix...?

***No***. You can start learning/using Elixir _today_ and
call Erlang functions when required, <br />
but you ***don't need*** to know Erlang
`before` you can use Phoenix!

### But Phoenix is _not_ "_Mainstream_" ... Should I/we _use_ it...?

There are _many_ web application frameworks you/we can choose from:
https://en.wikipedia.org/wiki/Comparison_of_web_frameworks <br />
So _why_ would _anyone_ select a framework written in a programming language
that is not "_mainstream_"...?

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

### What's "Wrong" with using Rails or Django?

The _original_ "_productive_" web frameworks
were "Ruby-on-Rails" and "Django" (_python_) back in 2005! <br />
(We _used_ both of these for periods in our "_journey_" and
can speak on the _advantages_ of each of them!) <br />

> There is "_nothing wrong_" with using Rails or Django. <br />
> We think there are still plenty of use-cases for both frameworks. <br />
> We just _know_ that it's (_a lot_) _easier_ to build "real-time" <br />
> with Phoenix because "Channels" (_WebSockets_) are baked in, <br />
> and the Elixir/Erlang concurrency is a whole different ballgame! <br />
> Erlang (and thus Phoenix) can handle
***millions*** of _concurrent users_ on a single server,<br />
> whereas a Rails/Django server can only handle a few thousand (_at best_!) <br />
> if your app is only serving a few thousand people at once, then you're fine!!

We ***love*** the fact that Erlang uses "_lighweight long-lived_" processes, <br />
which means we can connect _millions_ of (_IoT_) devices ...
For IoT Erlang is (_unquestionably_) the Answer! <br />
For simpler web apps where you only expect a few users per day,
Rails/Django are still viable.

But **why _compromise_** if you **don't _have_ to**? <br />
If you can have a [***Tesla***](http://www.cnbc.com/2015/08/27/teslas-p85d-is-the-best-car-consumer-reports-has-ever-tested.html) for the "price" of a Ford Focus,
why _wouldn't_ you?!? <br />
Why _settle_ for _good_ when you can _easily_ have/use the ***best***?

#### But GitHub Still Uses Rails ... Surely GitHub is "_Scalable_"?

***Yes***, GitHub is still using Rails for their Web App/Site. <br />
But ask _any_ of the _core_ team at GitHub if (_given the chance to start over_)
they would _chose_ Rails<br />
to build GitHub in 2017, and see how many of them say "_yes, of course_"
(_with a straight face..._)!

Also, GitHub does a _lot_ of things to Scale Rails in the background. <br />
And _many_ of their _newer_ (_client-side_) features are written in JavaScript!
see: https://github.com/github

> Bottom line is: _anything_ can be _made_ to scale using "DevOps", <br />
> but ***Phoenix*** is _made_ to **scale** by `default`
> because Erlang (was) _invented_ (to) scale!


### Why _NOT_ Use Go?

Read:
https://www.reddit.com/r/elixir/comments/3c8yfz/how_does_go_compare_to_elixir
<br />
(`help wanted` expanding this answer...)

### Why _NOT_ Use Scala and `Play` Framework _instead_...?

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
