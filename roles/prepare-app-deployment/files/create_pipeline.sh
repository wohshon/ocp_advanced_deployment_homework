#!/bin/bash
sudo oc login -u system:admin
oc project cicd
oc create -f buildconfig.yaml
