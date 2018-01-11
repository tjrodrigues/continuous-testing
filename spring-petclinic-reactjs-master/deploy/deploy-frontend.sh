#!/bin/bash
cd $HOME/petclinic/client
sudo -S <<< "eumetsatvv" npm install
sudo PORT=4444 npm start &


