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

