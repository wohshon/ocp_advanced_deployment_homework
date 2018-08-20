#!/bin/bash
oc login -u cain -p r3dh4t1!
oc new-app nodejs~https://github.com/openshift/nodejs-ex.git -n charlie
oc expose svc nodejs-ex -n charlie
oc login -u system:admin
oc project -n default
