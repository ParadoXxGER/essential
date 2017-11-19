#!/bin/bash

set -e

ruby build/wait_for_it.rb

rails test

rails test:integration