#!/bin/bash
oc login -u andrew -p r3dh4t1!
oc new-app nodejs~https://github.com/openshift/nodejs-ex.git -n alpha
oc expose svc nodejs-ex -n alpha
oc login -u system:admin
oc project -n default
