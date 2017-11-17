#!/bin/bash

set -e

rails db:migrate

rails s