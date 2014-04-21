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
GTS\_HOST="https://gitorious.local" GTS\_USER=test GTS\_PASS=test123 bundle exec rspec
```

### Notes

You need to create first user manually, because public registration is not enabled by default.

It is safe to run the tests against the same user, as new keys are generated on each run.

### Defaults:

 * GTS\_HOST defaults to `http://vagrant`

 * GTS\_USER defaults to `test`

 * GTS\_PASS defaults to `testest`

