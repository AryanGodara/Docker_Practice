FROM composer:2.1.8

WORKDIR /var/www/html

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]

#? Now, the entrypoint is the 'composer' executable, which exists inside of this composer
#? image and container, unlike on my localhost machine. And then we'll add a flag that should
#? be added to everycommand which is executed by it.
#* '--ignore-platform-reqs': Prevents some errors, even when a few dependencies are missing.