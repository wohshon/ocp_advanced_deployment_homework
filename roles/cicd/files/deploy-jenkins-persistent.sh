#!/bin/bash
sudo oc login -u system:admin
sudo oc new-project cicd
sudo oc new-app jenkins-persistent

