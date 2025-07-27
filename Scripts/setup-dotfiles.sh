#!/bin/bash

stow -t ~ ../dotfiles/. --dotfiles
git restore
