#!/bin/bash
oc login -u betty -p r3dh4t1!
oc new-app nodejs~https://github.com/openshift/nodejs-ex.git -n beta
oc expose svc nodejs-ex -n beta
oc login -u system:admin
oc project -n default
