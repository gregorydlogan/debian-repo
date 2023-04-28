#!/bin/bash

git co e/package && git rebase master && \
git co e/ci && git rebase master && \
git co e/loganite && git rebase e/ci
