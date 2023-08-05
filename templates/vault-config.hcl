cluster_addr  = "https://{{ ansible_host }}:8201"
api_addr      = "https:/{{ ansible_host }}:8200"
disable_mlock = true

ui = true

listener "tcp" {
    address = "{{ ansible_host }}:8200"
    tls_cert_file = "/opt/vault/tls/tls.crt"
    tls_key_file  = "/opt/vault/tls/tls.key"
}

listener "tcp" {
    address = "127.0.0.1:8200"
    tls_disable = 1
}

storage "raft" {
    path = "/opt/vault/data"
    node_id = "{{ inventory_hostname }}"
    retry_join {
        leader_tls_servername = "vault01.home.thejimnicholson.com"
        leader_api_addr = "https://10.0.96.61:8200"
    }
    retry_join {
        leader_tls_servername = "vault02.home.thejimnicholson.com"
        leader_api_addr = "https://10.0.96.62:8200"
    } 
    retry_join {
        leader_tls_servername = "vault03.home.thejimnicholson.com"
        leader_api_addr = "https://10.0.96.63:8200"
    } 



}