[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Ruby Objects vs JavaScript Objects

In JavaScript (JS), there's no distinction between Objects and key-value pairs
(a.k.a. hashes, a.k.a. associative arrays), and in fact, JS objects look and
behave similarly to Ruby hashes. However, objects in Ruby behave differently
from objects in JS.

## Prerequisites

-   The JavaScript Objects Series:

    -   [ga-wdi-boston/js-reference-types](https://github.com/ga-wdi-boston/js-reference-types)
    -   [ga-wdi-boston/js-objects](https://github.com/ga-wdi-boston/js-objects)
    -   [ga-wdi-boston/js-objects-this](https://github.com/ga-wdi-boston/js-objects-this)
    -   [ga-wdi-boston/js-objects-constructors](https://github.com/ga-wdi-boston/js-objects-constructors)
    -   [ga-wdi-boston/js-objects-prototypes](https://github.com/ga-wdi-boston/js-objects-prototypes)

-   [ga-wdi-boston/ruby-vs-js](https://github.com/ga-wdi-boston/ruby-vs-js)

## Objectives

By the end of this, students should be able to:

-   Contrast JS objects and Ruby objects.
-   Define a class for an object in Ruby that assigns attributes in the
    `initialize` constructor.
-   Create an instance of an object in Ruby using `.new`.
-   Write setter and getter instance methods for Ruby objects.

## Preparation

1.  [Fork and clone](https://github.com/ga-wdi-boston/meta/wiki/ForkAndClone)
    this repository.
1.  Install dependencies with `bundle install`.

## Introduction

Why does the word 'object' refer to two kinds of different things, depending on
whether we're talking about Ruby or JavaScript? The answer is that 'object' is
actually a much more generic term, referring to an abstraction that represents
both data and behavior. In the case of
object-oriented programming languages like JavaScript and Ruby, 'object' means
a self-contained collection of properties and methods.

At the end of the day, an object is just a conceit for the programmer.
The physical world is composed of objects (e.g. cars, buildings) which each have
their own attributes and behaviors, so having the ability to model things in
this way is very useful for solving problems.

Probably the biggest difference between how Ruby and Javascript deal with
objects is that Ruby is a 'classical' language; this means that Ruby uses
special objects called _classes_ to define and instantiate new objects.
More on classes in a minute.

## Object Definition and Instantiation

Let's briefly recap what we know about objects in JavaScript.

In JavaScript, a totally vanilla object can be created by simply typing `{}`,
also known as an object literal, or by using `new` plus a constructor function,
as follows:

```javascript
let x = new Object();
```

To create an object that has some particular set of properties,
you can write your own constructor function.
To add methods for those new objects to call,
define them on that constructor's `prototype`.

```javascript
const Rectangle = function(length, width) {
  this.length = length;
  this.width = width;
}
Rectangle.prototype.area = function(){
  return this.length * this.width;
};

let firstRect = new Rectangle(3,5);
firstRect.area();
// => 15
let secondRect = new Rectangle(10,2);
secondRect.area();
// => 20
```

In Ruby, the job of creating new objects falls on a special type of object
called a _class_. A class can be thought of as a template or factory for
creating new objects, **separate & distinct from the objects that it creates**,
which are referred to as _instances_ of the class.

Here's how we might translate the Rectangle example above into Ruby:

```ruby
class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
    @length * @width
  end
end

firstRect = Rectangle.new(3,5)
firstRect.area
# => 15
secondRect = Rectangle.new(10,2)
secondRect.area
# => 20
```

The `@` indicates that we're referring talking about an _instance variable_,
a property for which each individual instance produced by the class has a
unique copy.
In other words,
**every new Rectangle will have its own unique length and width values**.

As you can see, it's possible to define methods inside class definitions.
Generally speaking, these methods can be invoked on each instance of that class,
and so are called _instance methods_. `.area`, above, is one example.

`initialize`, however, is a special case. `initialize` plays a similar role to
constructor functions in JavaScript, defining specific values for
each instance's properties.
As you can see above, when we create a new object in JS,
we don't simply invoke the constructor function --
we need to use a special keyword, `new`, in order for it to work properly.
Similarly, in Ruby, we don't invoke `initialize` directly,
but instead invoke a special method, `.new`,
directly on the class we want to instantiate (in this case, `Rectangle`).

> Because there is no such thing as an 'Object Literal' in Ruby,
> all new objects _must_ be created using `.new`

### Lab

Inside this repo, in the folder `lib`, you'll find a file called `person.rb`.
In that file define a Ruby class for creating Person objects;
every Person object should have

-   a given name and surname
-   a favorite food
-   a catchphrase

Then, in the root of this repo, open up a Ruby interpreter with `pry`.
In the first line, run the command `require_relative 'lib/person.rb'`;
this will load the contents of the entire `person.rb` file into the terminal,
as if we had manually entered them one by one into the console.

Finally, instantiate a person object using `.new` and store it inside a
variable. What do you see in the console?

## Object Mutability

In JavaScript, once we'd created an object, we could dynamically add properties
and methods to it simply by calling their names, like so:

```javascript
let hs = {};
hs.givenName = "Homer";
hs.surname = "Simpson";
hs.favoriteFood = "donuts";
hs.catchphrase = "Doh!";
```

Although it's technically possible to add
new properties or methods to an existing object,
doing so is not very common.
Generally, all the properties and methods that a new object gets
will be created when that object is instantiated.

> One exception to this is that
> classes can sometimes be redefined, or 'reopened',
> after they've been written.
> However, this is very advanced Ruby usage,
> and we won't be covering it right now.

## Accessing Properties and Methods

In JavaScript, all properties and methods on an object are (by default) both
publicly readable and writeable. This means that we can do things like this:

```javascript
const Country = function (name){
  this.name: name,
  this.language: null
}

let brazil = new Country("Brazil");
brazil.language = "portuguese";
console.log(brazil.language);       // prints "portuguese"
```

In Ruby, **all instance variables are private** -
they can only be accessed or modified _within the object_ -
and all methods are public by default (though they can also be made private).

How then can we access the properties of a Ruby object from the outside?
Methods defined _within_ the object have access to those properties,
and since those methods can be (and usually are) public,
we can create methods specifically for accessing properties.
These methods are typically called 'getter' and 'setter' methods,
based on whether they're use to retrieve ('get') or change ('set') properties.

```ruby
class Country
  def initialize(name)
    @name = name
    @language
  end

  def language         # 'getter' for @language
    @language
  end

  def language=(lang)  # 'setter' for @language
    @language = lang
  end
end

england = Country.new("England")
england.language=("english")    # invoking the 'setter'
puts england.language()         # invoking the 'getter'
# => "english"
```

In the example above,
the value of the `@language` instance variable was not set
when we initialized a new `Country` object.
However, because we had a 'setter' method,
we were able to change the value of `@language` after the object was created.

> Ruby convention is for 'getter' and 'setter' methods to be named,
> respectively, `propertyName` and `propertyName=`

Of course, parentheses are optional when you invoke a method in Ruby,
and spaces are (usually) ignored,
so those two invocations could be rewritten as

```ruby
england.language = "english"    # invoking the 'setter'
puts england.language           # invoking the 'getter'
```

### Lab : Writing Getters and Setters

Go back to the `person.rb` file inside the `lib` directory.
For each of the instance properties you defined earlier,
create two accessor methods, a 'getter' and a 'setter',
so that those properties can be manipulated after the object is instantiated.

To check that your code is working correctly,
go to the root of the repo and run `rspec spec/person_spec.rb`;
if all tests are passing, you've done it right!

### Helper Methods for Accessing Properties

In this last exercise,
you created two methods for each property specified in the Person class.
This was necessary in order to have read and write access to those properties.
But writing all those nearly-identical pairs of methods was pretty tedious, no?

As you know by now, when programmers need to do repetitive tasks,
they usually try to find a way to automate and simplify the work.
And in fact, the developers of Ruby built in a couple of helper methods
for just this purpose.

```ruby
class Country
  attr_accessor :language

  def initialize(name)
    @name = name
  end
end

england = Country.new("England")
england.language = "english"
puts england.language
```

The Ruby method `attr_accessor` takes a symbol as an input and
creates 'getter' and 'setter' methods with that symbols as their name.
The code above is _functionally identical_ to the previous code block.

There are three `attr_` methods available for Ruby objects to use.

| Method Name     | Methods Created       | Other Notes                      |
|:---------------:|:---------------------:|:--------------------------------:|
| `attr_accessor` | 'getter' and 'setter' | The most commonly used.          |
| `attr_reader`   | 'getter' only         | Creating "read-only" properties. |
| `attr_writer`   | 'setter' only         | Rarely used. Uncommon use case.  |

If we wanted `@name` to be read-only, we might use `attr_reader` like so:

```ruby
class Country
  attr_accessor :language
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

england = Country.new("England")
puts england.name         # prints out "England"
england.name = "France"   # NoMethodError: undefined method `name=' for #<Country:0x__________________ @name="England">
```

By the way, did you notice that we didn't specify `language`
as an instance variable anywhere inside the Country class?
An added feature of all of the `attr_` methods is
that if the symbol passed in doesn't refer to an existing instance variable,
they will automatically create an instance variable
(with a name derived from the symbol) for it to refer to.

#### Lab: Creating a 'Shape' Class

Create a new file in the `lib` directory and call it `shape.rb`.
Inside that file, define a Shape class with the following instance variables:

-   `num_sides` : set during instantiation, read-only
-   `side_length` : set during instantiation, readable and writeable
-   `color` : NOT set during instantiation, readable and writeable

The initalize method should have the following signature:
`Shape.new(num_sides, side_length)`

The class should also have an instance method called `calculate_area`,
which calculates the area of a 'regular' shape (all sides equal)
for the given side length.
The [mathematical formula](http://www.mathopenref.com/polygonregulararea.html)
for this is

```md
A = n * s * s / (4 * tangent(PI/n))
```

where `n` is the number of sides, and `s` is the length of the side.

To test whether or not your code is working,
run the command `rspec spec/shape_spec.rb`

**HINT:** Ruby has a [module for performing
mathematics](http://ruby-doc.org/core-2.2.0/Math.html) called `Math`; it has a
lot of useful methods and properties that can help you out here. The `Math`
module is one of Ruby's default modules, so Ruby already knows how to find it;
to add it to your Shape object, and gain access to those methods and
properties, use the `include` keyword.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
