#!/bin/bash
sudo oc login -u system:admin
oc new-project smoke-test
oc new-app nodejs-mongo-persistent

