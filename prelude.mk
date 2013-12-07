# prelude.mk
# Primary Author: Benjamin Woodruff (benjaminwoodruff@ufl.edu)
# License: WTFPL

### Arithmetic #################################################################
# some concepts stolen from:
# http://www.cmcrossroads.com/article/learning-gnu-make-functions-arithmetic
int_16 := . . . . . . . . . . . . . . . .
# generate a list of 65536 elements
int_space := $(foreach a,$(int_16),\
	$(foreach b,$(int_16),\
		$(foreach c,$(int_16),$(int_16))\
	)\
)
int_max_value := $(words $(int_space))
int_encode = $(wordlist 1,$(1),$(int_space))
subtract = $(words $(wordlist 2,$(int_max_value),\
	$(wordlist $(2),$(1),$(int_space))\
))
add = $(words $(call int_encode,$(1)) $(call int_encode,$(2)))

### Lists ######################################################################
head = $(firstword $(1))
foot = $(lastword $(1))
tail = $(wordlist 2,$(words $(1)),$(1))
init = $(wordlist 1,$(call subtract,$(words $(1)),1),$(1))

map = $(foreach i,$(2),$(call $(1),$(i)))
foldl = $(if $(3),\
	$(call foldl,$(1),$(call $(1),$(2),$(call head,$(3))),$(call tail,$(3))),\
	$(2)\
)
foldr = $(if $(3),\
	$(call $(1),$(call head,$(3)),$(call foldr,$(1),$(2),$(call tail,$(3)))),\
	$(2)\
)

sum = $(call foldl,add,0,$(1))
_reverse = $(2) $(1)
reverse = $(call foldl,_reverse,,$(1))

# $(call range,$(i)) will give a range from 0 to i-1
_range = $(1) $(call add,$(call foot,$(1)),1)
range = $(call foldl,_range,0,\
	$(wordlist 2,$(int_max_value),$(call int_encode,$(1)))\
)

zip = $(join $(1),$(2))
zip3 = $(join $(join $(1),$(2)),$(3))
