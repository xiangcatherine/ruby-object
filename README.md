![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Ruby Objects vs JS Objects

## Prerequisites

- Programming Fundamentals in Ruby (versus JavaSript)

## Introduction

Yesterday, you learned about hashes in Ruby. In JavaScript, there's no distinction between Objects and key-value pairs (a.k.a. hashes, a.k.a. asociative arrays), and in fact, JavaScript objects look and behave similarly to Ruby hashes. However, objects in Ruby behave differently from objects in JS.

## Objectives

By the end of this lesson, students should be able to:

- Explain some of the differences between Hashes and Objects within Ruby, including:
    - instantiating new objects
    - creating new properties
    - accessibility/privacy
- Define a class for an arbitrary object and instatiate it.


## What is an Object?

Why does the word 'object' refer to two kinds of different things, depending on whether we're talking about Ruby or JavaScript? The answer is that 'object' is actually a much more generic term. In pure computer science, an object is simply a location in memory that holds a particular value. In the case of object-oriented programming languages, like JavaScript and Ruby, 'object' means a self-contained collection of properties and methods.

At the end of the day, the idea of an object is just a conceit. The physical world is composed of objects (e.g. cars, buildings, people) which each have their own attributes and behaviors, so having the ability to model things in this way is very useful for solving problems.

## JS Objects vs Ruby Object
As far as objects go, probably the biggest difference between Ruby and JavaScript is that Ruby is a 'classical' language; this means that Ruby uses things called Classes to define and instantiate objects (as compared to JavaScript,)

### Definition and Instantiation

In JavaScript, a totally vanilla object can be created by simply typing `{}`, also known as an object literal, or by using `new` plus a constructor function, as follows:

```javascript
var x = new Object();
```

To create an object that has a given set of properties, just write a different constructor function.

```javascript
var Dog = function(name, breed) {
  this.name = name;
  this.breed = breed;
}

var rover = new Dog("Rover","greyhound");
```

**In Ruby, there is no such thing as Object Literal syntax**; instead objects **must** be created with a constructor, using the syntax below.

```ruby
x = Object.new
```

> Remember, in Ruby, it's not necessary to write parentheses to invoke a method (though it's common to do so if a method has arguments).

How do we define an object so that it has a given set of properties? In Ruby, this is accomplished using a type of object called a _class_. A class can be thought of as a template or definition for the object, but separate and distinct from the object itself; the class contains a constructor function, which specifies the properties that the object will have.

Here's how we might create the above 'Dog' object in Ruby:

```ruby
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end
end
```

The `@` means that this property belongs individually to each specific instance of Person - in Ruby, this is called an _instance variable_.

Methods for a given object also get specified inside the class.

```ruby
class Dog
  def initialize(name, breed)
    @name = name
    @breed = breed
  end

  def bark
    puts "WOOF"
  end
end
```

#### Pair Up!
Fork and clone this repo. Inside the folder `lib`, you'll find a file called `person.rb`. Inside this file, create a class for a Person object that has the following properties: name, age, and dare of birth.

Then, in the root directory of this repo, open up a ruby interpreter using the command `pry`. In the first line, run the command `require_relative 'lib/person.rb'`; this will load the contents of the entire `person.rb` file, as if we had entered them manually into the console.

Finally, instantiate a person object using `.new` and store it inside a variable. What do you see in the console?

### Mutability

In JavaScript, once we'd created an object, we could dynamically add properties and methods to it simply by calling their names, like so:

```javascript
var x = {};
x.name = "Matt";
x.favoriteFood = "blueberries";
```

In Ruby, it's possible to add new properties or methods to an existing object, but it's not very common. Generally, all the properties and methods that an object will have will be laid out in the class.

### Access

In JavaScript, all properties and methods on an object are (by default) both publicly readable and writeable. This means that we can do things like this:

```javascript
var phil = {
  name: "Phil",
  occupation: "researcher",
  bestFriend: "Lem",
  doScience: function() {
    console.log("SCIENCE!!");
  }
}
console.log(phil.name);  // prints "Phil"
phil.doScience();        // "SCIENCE!!"
phil.bestFriend = "Ted"; // Changes the value of phil.bestFriend
```

In Ruby, by default, all instance variables are private - they can only be accessed or modified _within the object_ - while methods are all public. In order to retrieve manipulate the properties of a Ruby object from the outside, we therefore need to create methods that can either retreive ('getter') or change ('setter') the value of a property.

```ruby
class Country
  def initialize(name)
    @name = name
    @language
  end

  def get_language
    @language
  end

  def set_language(lang)
    @language = lang
  end
end

england = Country.new("England")
england.set_language("english")
puts england.get_language
```

Above, the value of the `@language` instance variable was not set when we created the new Country object. However, because we had a 'setter' method (in the form of `set_language`), we were able to set its value after the object was created.

However, creating two methods (a 'setter' and a 'getter') for every property of an object is pretty tedious, especially since the methods are all essentially the same for every variable. Fortunately, Ruby gives us two handy shortcuts to help keep our code DRY.

```ruby
class Country
  def initialize(name)
    @name = name
  end

  attr_accessor :language
end

england = Country.new("England")
england.language = "english"
puts england.language
```

The Ruby keyword `attr_accessor` will _create our setters and getters for us_. We didn't even need to specify that `language` was a property of a Country object - Ruby will automatically add `language` as a property if it doesn't exist already. We can also create read-only properties using the `attr_reader` keyword, like so:

```ruby
class Country
  def initialize(name)
    @name = name
  end

  attr_accessor :language
  attr_reader :name
end

england = Country.new("England")
puts england.name         # prints out "England"
england.name = "France"   # NoMethodError: undefined method `name=' for #<Country:0x__________________ @name="England">
```

#### Pair Up!
Inside the `lib` directory, create a new file called `animal.rb`. Inside it, create a class called Animal (which, naturally, will create Animal objects). Each Animal object should have the following properties:
* `name`
* `age`
* `favorite_food`

Set `name` and `age` in the constructor. Make `name` 'read-only', and make `age` totally private. Make `favorite_food` both readable and writeable.


#### On Your Own!
Create another file in the `lib` directory called `shape.rb`. Inside it, create a Shape class, with the following properties:
* name (set in constructor, private)
* num_sides (set in constructor, readable)
* color (NOT set in constructor, readable and writeable)
* side_length (set in constructor, but both readable and writeable)

It should also have a method called `calculate_area`, which calculates the area of a 'regular' shape (all sides equal) for the given side length. The [mathematical formula](http://www.mathopenref.com/polygonregulararea.html) for this is

`A = n * s^2 / (4* tangent(Pi/n))`

where n is the number of sides, and s is the length of the side.

#####HINT:
Ruby has a [module for performing mathematics](http://ruby-doc.org/core-2.2.0/Math.html) called `Math`; it has a lot of useful methods and properties that can help you out here. The `Math` module is one of Ruby's default modules, so Ruby already knows how to find it; to add it to your Shape object, and gain access to those methods and properties, use the `include` keyword.







