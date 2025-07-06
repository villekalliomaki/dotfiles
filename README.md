# dotfiles

Automated Arch Linux desktop installation using Ansible. Playbooks are located in `./install`, which all can be run in the correct order using `run_all.yml`. Root access is required, and using --ask-become-pass is recommended.

Steps necessary before running any playbook are listed in [`./install/README.md`](./install/README.md).

Depends on SSH + Wireguard private keys and root CA certificate in `./secrets` directory, which is synchronized outside of version control.

```
secrets
├── [root ca base domain].crt
├── ssh
│   ├── authorized_keys
│   ├── config
│   └── private_keys
│       ├── host1
│       ├── host2
│       └── host3
├── wallpapers
│   └── 1.jpg
└── wg
    ├── host1
    │   ├── host1.key
    │   ├── host1.pub
    │   └── wg0.conf
    ├── host2
    │   ├── host2.key
    │   ├── host2.pub
    │   └── wg0.conf
    └── host3
        ├── host3.key
        ├── host3.pub
        └── wg0.conf
```

