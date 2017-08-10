# Rails Attribute API example

This app demonstrates a few interesting possibilities afforded by the new API, including:

1. Default values
2. Encrypted Fields
3. Custom Types

## Getting Started

For simplicity, this app uses RSA keys for encryption. You'll need to generate a new keypair,
and convert your public key to PEM format.

```
$ ssh-keygen -t rsa -f ~/.ssh/example
$ ssh-keygen -f ~/.ssh/example -e -m pem > ~/.ssh/example.pem
```

After that, just the regular startup routine is necessary. This example uses features specific to Postgres.

```
$ bundle
$ rails db:setup
$ rails server
```
