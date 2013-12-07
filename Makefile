.PHONY: test

include prelude.mk

_increment = $(call add,$(1),1)

test:
	@echo arithmetic
	@echo $(call subtract,500,246) # 254
	@echo $(call add,254,246) # 500
	@echo
	@echo head/foot/tail/init
	@echo $(call head,a b c d)
	@echo $(call foot,a b c d)
	@echo $(call tail,a b c d)
	@echo $(call init,a b c d)
	@echo
	@echo map
	@echo $(call map,_increment,1 2 3 4 5)
	@echo
	@echo sum
	@echo $(call sum,1 2 3 4 5 6) # 21
	@echo
	@echo reverse
	@echo $(call reverse,a b c d e f g)
	@echo
	@echo range
	@echo $(call range,10)
	@echo
	@echo zip
	@echo $(call zip,a b c d e,1 2 3 4 5)
