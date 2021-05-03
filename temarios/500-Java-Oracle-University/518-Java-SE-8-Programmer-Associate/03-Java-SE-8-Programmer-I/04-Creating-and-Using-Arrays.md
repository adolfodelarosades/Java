# 4: Creating and Using Arrays

1. Creating and Using Arrays - 11m

## 1. Creating and Using Arrays - 11m

This section covers the creation and the use of arrays. All right, what we need to remember is how to do the basic operations on arrays. First we need to be able to declare it. Please note, the square brackets could go on either side of the declaration there. You could say int and then square brackets. primes is your name of the array. Or you could say Product square brackets things. Let's say things is the name of the array. Or you can actually put the square brackets after the name of your array object, after that variable name. Either way you want, doesn't matter. So whichever way you fancy, kind of goes on either side here.

So that's a declaration of array object. So far it's not initialized. So it's null.

The next thing is the creation of an actual array object with a new operator as you do. Array, remember, is an object. So new operator creates a new instance of that.

On the left hand side here, you've got an integer array of four elements. On the right hand side, you've got a Product array of three elements.

Now array, at this stage, is allocated in a heap. But its content is not initialized yet. So that's our next stage, to initialize the content. On the left hand side, you can see here we're initializing a primes array and we're assigning some values to different elements. So on the right hand side, we initialize this things array. And we put some new Products there.

However, note that the order in which you do it could be random. You don't have to start from the beginning or the end. Yeah, you can just randomly initialize any elements you like. Also note that you don't have to initialize the entire content. You may leave some elements in arrays not initialized.

While accessing array content, you need to remember where the boundaries of the array are. The arrays in Java are indexed starting from zero. So for example in the left hand side, we have four elements in that integer array, and on the right hand side, three elements in a Product array. The last valid index position will be, on the left hand side, three, and the right hand side, two, because we started from zero. So if you try and access the primes element at position four and say, assign 11 to it, or things element at position three and assign another product which is "Salt" here, well, I'm afraid you will end up with an ArrayIndexOutOfBoundsException, in those two cases.

Also, when accessing array content, just use the index. And you can actually access objects in arrays and modify them. You don't have to retrieve them in any intermediate variables. So for example, things at position two, setName("Salad"). Yeah, you change the onion to be a salad, and that's perfectly fine. And on the left hand side, you're accessing some primes number which was three, and you're adding two to it, so that's five. Yes, again, perfectly fine.

What about if you try to access the element in the array that you forgot to initialize? See, there will be a difference there. In the first case, the left hand side, primes at position one divided by primes at position two, the primes at position two has never been initialized in this example. It's a primitive. It's an int, so the default value is zero. Oh, well, in this case you'll just try to divide by zero. That's not going to work.

Now on the right hand side, you've got things at position one getName. Again, you would never initialize the actual element at position one in that things array. How can you possibly get a name? It's null. So you'll end up with null pointer exception.

So the nature of exception when accessing a noninitialized array element depends on whatever that was an array of primitives, or it was an array of objects. In the array of objects case, you always get your null pointer when you try to access something that you have forgot to initialize. But an array of primitives, not necessarily. You might get an exception if you divide by zero, but then again, if you're using some other operation, you might not notice that the element hasn't been initialized explicitly because it defaults to zero. So you have to be careful about that.

Let's take a further look, this time, at a kind of a simple shortcut way to create and initialize the array in one go. You declare in here an integer array of primes and a Product array of things. And you initialize it straight ahead. Essentially you're just passing the future array content as a list, as a comma separated list there. Do some close and curly brackets. So that will do all of the steps of declaration, initialization, and a population of content of the arrays all in one go. In the array of objects actually, notice that you can pass nulls, which basically means you reserve in there the element but you haven't actually set any value to it.

The array can be a multidimensional array. Well you just sort of add dimensions by declaring it with more than one set of square brackets, as in this particular case, this integer array called square. It's an array of, if you like, two columns and two rolls. So it's a square shape. Or it could be an array of objects actually, like that array of things, which is, again, kind of square shaped, like a matrix of objects if you like.

However, it's interesting that it doesn't really have to be square shape. That matrix array, which is a third example of code here, is kind of asymmetrical. So you have one sort of row we made, if you like, having elements one and five, and another having elements two, four, and six. That's perfectly normal.

When you are accessing such multidimensional array, you could simply use both indexes at the same time. So you could see in this particular case, we have this for loop iterating through the array of things. We're going through all of the items in that array sort of in one dimension. And then inside that loop, we've got another loop. And for each item that we retrieved in a first loop, we retrieve there an array. So we say things at position i dot length. That's a condition which allows me to tell how many items I've got in each array that are retrieved out of first array.

And then using both i and j indexes there, things at i, j position, sort of an intersection there within that matrix, accessing that object, and getting a relevant value out of it, get a name or modifying that object in some way. So that's how would you access elements in the multidimensional array.

One more thing-- the array in Java is a collection of elements of the same type and of a fixed length. At a point when you have initialized the array object, you fixed the length of it. You cannot make that array bigger or smaller. What you can do, however, you can create another array. And you can make part of your first array or entire first array of yours copied into the other array. And that other array could be bigger, or smaller, whatever you need. So you can sort of resize that way.

But bear in mind it's not really resizing the same object, it's just creating another object into which you copy the content from the first one and assign a different size when you were initializing that other object. That is done with a class System method, arraycopy. And parameters work like this. The first parameter is a source array from which you want to copy things. Second parameter is a position within that source arrays. So that's two in this case. Third parameter is a target destination array where you want to copy things to. Then there is a destination position. And then there is a length of content to copy from the source, so how many elements to actually grab. There you go. That's some sort of resize, but really recreation of an array with a different size if necessary.

And that's about it for this section. It's quite straight forward. We've seen what we need to do to declare, instantiate, initialize, and use the content in one dimensional array or in multidimensional array. Let's proceed to the next section.
