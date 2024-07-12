ifneq ($(KERNELRELEASE),)

obj-m := hid-mcp2221.o

else

.PHONY: all
all:
	$(MAKE) -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

.PHONY: clean
clean:
	rm -f *.o *.ko *.mod* .*.cmd modules.order Module.symvers

endif
