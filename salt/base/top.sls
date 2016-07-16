base:
  '*':
    - init.init
prod:
  'linux-node*':
    - cluster.haproxy-outside
    'linux-node1':
    - cluster.keepalived-outside-master 
    'linux-node2':
    - cluster.keepalived-outside-slave