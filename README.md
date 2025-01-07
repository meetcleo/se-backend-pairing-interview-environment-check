# Senior Backend Engineer Environment Check

This repository contains checks to verify that your local development environment is correctly set up to complete the senior engineer pairing interview.

## Running the checks 

You should be able to run these checks by simply cloning this repo and running the default rake task.

1. `$ git clone git@github.com:meetcleo/se-backend-pairing-interview-environment-check.git`
2. `$ cd se-backend-pairing-interview-environment-check`
3. `$ rake`

## What this repository checks

### Ruby Version

This check verifies that the required Ruby version is installed and properly configured on your machine. It ensures that the version specified in the `.ruby-version` file loads correctly in your environment.

### SQLite Installation

This check confirms that you have a functional SQLite installation. It tests your ability to create local databases and perform read and write operations.

