let
    n1x-d3skt0p = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICkw6KLh58hXfnsgA01+cMkhqc+D28BU573Zhg4NgOmG";
    nixos-host = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3BaNh0eBm3n5sO5jiNTdbxe2vpLtfipgAtog3eBpHu9ZHDL/OcVJzv6smWNYZ7t+Lj2VkeYEx0/hPB5SvAIkhn8JXvfUOadiJeNS1Pn6JaG+WjCsd6J8Nvd57g50iTINjXRNr1bMyaRM4MaC4ABmhpBT6pAVR804r+C8RwbDoGQq47v6I/B8Cqq+hXIEo5ULbh7Zh5WdEs0g+03CUjTz53CtG64fe29xy6JRp6VaxlKYgYTRE5+T2aZUymsY8CowTb+jNWHKqfKcWLc90+Tw+34emZZwmBFs/30PAkSfCiVUB99OI7OYjME3/4jGp7AGUOCglBOW7CqX4GsuXpSQkKVjsGIxHtx724wuza2XJlo/bri7ngiBOAiY/BLP9nJfZcQCYsU+w9ILSxU8/qq+uBbw7IA65JZNzFxuPAJ7zOwmxtXxagd/J6KEPia62OBSd2q3O3q3yBt0a3gWjG0BJ4t/NxjrxUkAVce7prXw2z9xGkSeXbPhDepOCDnd6cgje6weIvuL3Mz3/G1EeUveaCGlpXuqKavLO4jF+5ImZmGichnXv8vHuTT601kGAF/jqywQxkRtyYIyGQStmlfm2KskccDQfntgn61TfZfuawM6aAxTCVqmCiJibmzMm+jCxKLS2HnCQzN6lHLmDZ92aVZs8u5YYpGUnYiKBoLQ4FQ== skoch@sks-concept.de";
in {
    "secret1.age".publicKeys = [ n1x-d3skt0p nixos-host ];
    "ecomex-secrets.age".publicKeys = [ n1x-d3skt0p nixos-host ];
}