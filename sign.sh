#!/bin/bash

gpg --batch --yes --output Release.gpg --local-user 3259FFB3967266533FCD4B249A7EA8E5B3820B26 --detach-sign "$1"
