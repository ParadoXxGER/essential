#!/bin/bash

set -e

ruby build/wait_for_it.rb

rubocop app/** test/**  build/** config/**

rails test

rails test:integration