#!/bin/bash

set -e

ruby build/wait_for_it.rb

rubocop

rails test

rails test:integration