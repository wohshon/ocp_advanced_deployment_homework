#!/bin/bash
sudo oc login -u system:admin
sudo oc new-project smoke-test
sudo oc new-app nodejs-mongo-persistent

