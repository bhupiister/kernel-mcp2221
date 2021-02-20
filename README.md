# Kernel logger

Kernel logger is a kernel module that can be used as a replacement for `logger` or `logwrapper`.

Its log is similar to systemd's journal and can be read by `dmesg` or `journalctl`.

## Use cases

- You need to record the logs of initramfs and hope that journald can keep these logs.
- You want a logger, but do not want or cannot make any changes to a program.
- You find it annoying to type `logger` again and again in a shell script.

## Why not kmsg or logger

- kmsg could not add a tag
- `logger` needs a backend

## Quick start

1. Compile and load this module

```sh
make
sudo insmod logger.ko
```

2. Run a shell command to test it

```sh
echo "This is just a test" > /dev/logger
dmesg | grep "This is just a test"
journalctl -b | grep "This is just a test"
```

## Usage in shell script

Just add the following to the beginning of your shell script:

```sh
exec > /dev/logger 2>&1
```

## License

This project is licensed under [GPL-2.0](LICENSE).
