# smtprelay
[![Go Report Card](https://goreportcard.com/badge/github.com/decke/smtprelay)](https://goreportcard.com/report/github.com/decke/smtprelay) ![build workflow](https://github.com/OpenCirclePkgs/smtprelay/actions/workflows/build.yml/badge.svg)


Simple Golang based SMTP relay/proxy server that accepts mail via SMTP and forwards it directly to another SMTP server.

This repo only creates a Docker container from the binary releases on https://github.com/decke/smtprelay/ using github actions.


## Why another SMTP server?

Outgoing mails are usually send via SMTP to an MTA (Mail Transfer Agent)
which is one of Postfix, Exim, Sendmail or OpenSMTPD on UNIX/Linux in most
cases. You really don't want to setup and maintain any of those full blown
kitchensinks yourself because they are complex, fragile and hard to
configure.

My use case is simple. I need to send automatically generated mails from
cron via msmtp/sSMTP/dma, mails from various services and network printers
via a remote SMTP server without giving away my mail credentials to each
device which produces mail.


## Main features

* Simple configuration with ini file .env file or environment variables
* Supports SMTPS/TLS (465), STARTTLS (587) and unencrypted SMTP (25)
* Checks for sender, receiver, client IP
* Authentication support with file (LOGIN, PLAIN)
* Enforce encryption for authentication
* Forwards all mail to a smarthost (any SMTP server)
* Small codebase
* IPv6 support
