#!/bin/bash
sudo oc login -u system:admin
oc new-project cicd
oc new-app jenkins-persistent

