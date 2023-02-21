# container-entrypoint

Simple script for use as entrypoint to a container.

Attempts to intelligently decide if a command is an argument to an application or calling as system
command. In other words, it is intended to allow all the following use cases:

```
$ docker run --rm foo --version
foo 0.8

$ docker run --rm foo echo boo
boo

$ docker run -it foo sh
/ #
/ # exit
```

To use the script, set it as the ENTRYPOINT in a Dockerfile or equivalent, making sure it is
executable. Also set the environment variable `BASE_COMMAND` appropriately. For example:

```
$ docker run --rm -e BASE_COMMAND="uname" my_image -a
Linux f3c6b322e73a 5.15.49-linuxkit #1 SMP PREEMPT Tue Sep 13 07:51:32 UTC 2022 aarch64 Linux
```

We've used `-e` for the purposes of this demo, but the variable should be set in the Dockerfile or
by editing the script.

This script is based on the [NodeJS entrypoint script](https://github.com/nodejs/docker-node/blob/e75fa5270326ffaff8fee03153f3bf16860084d4/19/bullseye-slim/docker-entrypoint.sh).
