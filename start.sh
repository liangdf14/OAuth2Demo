#!/bin/bash

nohup java -jar /tmp/demo/demo-server/build/libs/demo-server.jar > /tmp/demo/demo_server.log 2>&1 &

sleep 10

nohup java -jar /tmp/demo/demo-resource/build/libs/demo-resource.jar > /tmp/demo/demo_resource.log 2>&1 &

sleep 10

nohup java -jar /tmp/demo/demo-client/build/libs/demo-client.jar > /tmp/demo/demo_client.log 2>&1 &

tail -f /tmp/demo/demo_server.log /tmp/demo/demo_resource.log /tmp/demo/demo_client.log


