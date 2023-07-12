listener "tcp" {
    address = "{{ ansible_ip_address }}:8200"
}

listener "tcp" {
    address = "127.0.0.1:8200"
    tls_disable = 1
}

storage "raft" {
    path = "/var/local/raft"
    node_id = "{{ ansible_hostname }}"
    retry_join {
        leader_api_addr = "http://
    } 
}