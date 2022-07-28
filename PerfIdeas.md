# Ideas for MiniScript Performance Enhancement

## TAC Optimization

We should standardize on a simple TAC assembly format, so that we can hand-optimize some of our benchmarks and see how much speed we can possibly obtain this way.  If that seems promising, then add an optimizer module that goes over the TAC of a function and does things like:

- *lifetime analysis*, especially on temps, to reduce the number of these used
- *type analysis*, particularly noting places where a variable can't be a function, so we don't need to try to call it or copy it into a temp
- *temp elimination*, where we compute a result into a temp then immediately copy the temp into a variable
- *constant propagation*
- *common subexpression elimination* (where possible)

## Variable Lookups

I suspect we spend a lot of time hashing variable names and looking them up in maps.  Most of those maps are pretty small most of the time (just the set of local variables in some call frame, typically fewer than 10 or so).  It might be worth having some data structure that looks like a map but is actually just a list of key/value pairs, perhaps quickly reordered so that most recently accessed ones are checked first.

Or, if we can assign a slot number to each local variable as we compile, then maybe we can look those up without any string comparisons at all in most cases.

## Computed Ranges

We could have range() return a special sort of "computed sequence" that only contains the start, end, and step, and does a bit of math to quickly return the requested entry for any index.  This might help in cases where you're doing a big for loop over many thousands of steps, since it avoids allocating that big list.  As soon as any code tries to mutate this list, we would convert it into a regular in-memory list at that time.

## Optitmized For Loop

If we could somehow know that the user hasn't overridden range(), then we could eliminate the list entirely, and compile the start/end/step directly into the TAC.  But knowing that is difficult and I'm not sure how much benefit this would bring.

## Inlined Functions and Constants

If we can know that the user never reassigns a function, then we could inline it in some cases, eliminating the function call overhead.  Same for constants.

I'm not sure how we could know that, though, especially in the context of a REPL.  We might need some kind of `final` keyword.  Which I don't love, as it's not MiniScript-y.
