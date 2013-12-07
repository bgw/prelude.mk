`prelude.mk`
============

What the hell is this?
----------------------

Some of the more interesting functions in Haskell's [`prelude.hs`][plhs],
re-written in GNU make, *without shelling out or using guile*.

[plhs]: http://hackage.haskell.org/package/base-4.6.0.1/docs/Prelude.html

Why?
----

In theory, these functions could be used to write more advanced makefiles. In
practice, GNU make is such a restricted environment (without shelling out), that
the implementation we have to create for many of our functions is absurd.

Basically, I wrote this *because I could*.

Can I use this?
---------------

It's under the WTFPL, so yes.

How do I use this?
------------------

Copy `prelude.mk` to your project, and put in your Makefile

```make
include prelude.mk
```

Prelude's functions can be called with make's `call` function:

```make
all:
    @echo $(call sum,$(call range,100))
```

Should I use this?
------------------

**No**. Dear god. *No*.

It would be reasonable to reimplement many of these concepts using the `shell`
function, but don't try to use this pure-make implementation.
