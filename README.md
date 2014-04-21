# Gitorious Smoke Tests

This repository contains a set of smoke tests used to validate Gitorious builds.

## Installation

1. Install poltergeist

2. Install dependencies
```
bundle install
```

## Usage

1. Start Gitorious instance (`https://gitorious.local`)

2. Create an user (`test`/`test123`)

3. Run the specs
```
GTS_HOST="https://gitorious.local" GTS_USER=test GTS_PASS=test123 bundle exec rspec
```

### Notes

You need to create first user manually, because public registration is not enabled by default.

It is safe to run the tests against the same user, as new keys are generated on each run.

### Defaults:

 * GTS_HOST defaults to `http://vagrant`

 * GTS_USER defaults to `test`

 * GTS_PASS defaults to `testest`

