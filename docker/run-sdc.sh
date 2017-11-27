#!/bin/bash 

mkdir /etc/rexray

cat > /etc/rexray/config.yml << EOF
rexray:
  logLevel: info
  modules:
    default-docker:
      type:     docker
      desc:     The default docker module
      host:     unix:///etc/docker/plugins/rexray.sock
      spec:     /etc/docker/plugins/rexray.spec
      disabled: false
libstorage:
  service: rbd

rbd:
  defaultPool: rbd
EOF

rexray start -l debug 
