---
tags:
  - kusama
  - polkadot_ecosystem
  - substrate
  - rust
  - node
  - rpc
---

**Walk-Through/Substrate/NodeSetup**

👩‍🏫👩‍🏫👩‍🏫

## Introducing

[substrate-node-template](https://github.com/substrate-developer-hub/substrate-node-template)

[Create-your-first-substrate-chain](https://docs.substrate.io/tutorials/v3/create-your-first-substrate-chain/)

## Prerequisites

Ubuntu 20.04, Docker 19-20, Ngnix, Nodejs 16.13.2, ReactJs, VirtualBox(Optional).

## installing

**Manifest for installing rust and build-essentials on ubuntu 20.04.03**
```
rustup self uninstall

apt-get update

sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"

apt-get -u dist-upgrade

apt install aptitude

sudo aptitude install libc6=2.31-0ubuntu9

sudo aptitude install build-essential

apt-get update

sudo apt install -y cmake pkg-config libssl-dev git gcc build-essential clang libclang-dev

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain none -y

rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy

rustup default stable

rustup update nightly

rustup update stable

rustup target add wasm32-unknown-unknown --toolchain nightly

rustup component add rust-src --toolchain stable-x86_64-unknown-linux-gnu

rustc --version

source $HOME/.cargo/env

cargo install --git https://github.com/alexcrichton/wasm-gc --force
```

No tested on me Fast Installation: Install all the required dependencies with a single command. (Be patient, this can take up to> 30 minutes)

``` curl https://getsubstrate.io -sSf | bash -s -- --fast ```

> Finally step test:

```Cargo Getting Start```

🤷‍♂️🤷‍♂️🤷‍♂️:🐱‍👤

linking_with_cc_failed_exit_code_1/build-essential-fails-because-of-unmet-dependencies

👆👆👆

**Manifest for cargo and compiling**

**#rustup component add --toolchain=nightly rust-src rustfmt**

```rustup target add wasm32-unknown-unknown```

```apt-get install llvm clang linux-headers-"$(uname -r)"```

```apt install llvm clang```
```cargo build --release```

#cargo fix --allow-dirty#cargo fix --edition

```
 -lsb_release -a
  No LSB modules are available.
  Distributor ID:	Ubuntu
  Description:	Ubuntu 20.04.3 LTS
  Release:	20.04
  Codename:	focal
 -docker --version
  Docker version 20.10.12, build e91ed57
 -ldconfig --version
  ldconfig (Ubuntu GLIBC 2.31-0ubuntu9.2) 2.31
 -cargo --version
  cargo 1.60.0-nightly (25fcb13 2022-02-01)
 -rustc --version
  rustc 1.60.0-nightly (f624427f8 2022-02-06)
 -rustup show
  Default host: x86_64-unknown-linux-gnu
  rustup home:  /root/.rustup
  installed targets for active toolchain
  --------------------------------------
  wasm32-unknown-unknown
  x86_64-unknown-linux-gnu
  active toolchain
  ----------------
  nightly-x86_64-unknown-linux-gnu (default)
  rustc 1.60.0-nightly (f624427f8 2022-02-06)
```

🤷‍♂️🤷‍♂️🤷‍♂️:🐱‍👤

Error: failed to run custom build command for librocksdb-sys v6

👆👆👆

## Single-Node Development Chain

This command will start the single-node development chain with persistent state:
```
/substrate-node-template
cargo build --release && ./target/release/node-template --ws-external --base-path ./my-chain-state --enable-offchain-indexing true --rpc-cors all --name "Arman Riazi" --pruning archive --prometheus-external --chain local  --dev #(or --chain fir)
```

```./target/release/node-template --dev```

Purge the development chain's state:

```./target/release/node-template purge-chain  --chain local --dev```

Start the development chain with detailed logging:

```RUST_LOG=debug RUST_BACKTRACE=1 ./target/release/node-template -lruntime=debug --dev```

✍️✍️✍️

After Running Node(Limited Lines):
```
root@ubuntu:/home/substrate-node-template# ps -ef
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 12:49 ?        00:00:02 /sbin/init splash
root           2       0  0 12:49 ?        00:00:00 [kthreadd]
root           3       2  0 12:49 ?        00:00:00 [rcu_gp]
root           4       2  0 12:49 ?        00:00:00 [rcu_par_gp]
root           6       2  0 12:49 ?        00:00:00 [kworker/0:0H-events_highpri]
root           9       2  0 12:49 ?        00:00:00 [mm_percpu_wq]
root          10       2  0 12:49 ?        00:00:00 [rcu_tasks_rude_]
root          11       2  0 12:49 ?        00:00:00 [rcu_tasks_trace]
root          12       2  0 12:49 ?        00:00:00 [ksoftirqd/0]
root          13       2  0 12:49 ?        00:00:05 [rcu_sched]
root          14       2  0 12:49 ?        00:00:00 [migration/0]
root          15       2  0 12:49 ?        00:00:00 [idle_inject/0]
root          16       2  0 12:49 ?        00:00:00 [cpuhp/0]
root          17       2  0 12:49 ?        00:00:00 [cpuhp/1]
root          18       2  0 12:49 ?        00:00:00 [idle_inject/1]
root          19       2  0 12:49 ?        00:00:00 [migration/1]
root          20       2  0 12:49 ?        00:00:00 [ksoftirqd/1]
root          22       2  0 12:49 ?        00:00:00 [kworker/1:0H-events_highpri]
root          23       2  0 12:49 ?        00:00:00 [cpuhp/2]
root          24       2  0 12:49 ?        00:00:00 [idle_inject/2]
root          25       2  0 12:49 ?        00:00:00 [migration/2]
root          26       2  0 12:49 ?        00:00:00 [ksoftirqd/2]
root          28       2  0 12:49 ?        00:00:00 [kworker/2:0H-events_highpri]
root          29       2  0 12:49 ?        00:00:00 [kdevtmpfs]
root          30       2  0 12:49 ?        00:00:00 [netns]
root          31       2  0 12:49 ?        00:00:00 [inet_frag_wq]
root          32       2  0 12:49 ?        00:00:00 [kauditd]
root          33       2  0 12:49 ?        00:00:00 [khungtaskd]
root          34       2  0 12:49 ?        00:00:00 [oom_reaper]
root          35       2  0 12:49 ?        00:00:00 [writeback]
root          36       2  0 12:49 ?        00:00:00 [kcompactd0]
root          37       2  0 12:49 ?        00:00:00 [ksmd]
root          38       2  0 12:49 ?        00:00:00 [khugepaged]
root          86       2  0 12:49 ?        00:00:00 [kintegrityd]
root          87       2  0 12:49 ?        00:00:00 [kblockd]
root          88       2  0 12:49 ?        00:00:00 [blkcg_punt_bio]
root          89       2  0 12:49 ?        00:00:00 [tpm_dev_wq]
root          90       2  0 12:49 ?        00:00:00 [ata_sff]
root          91       2  0 12:49 ?        00:00:00 [md]
root          92       2  0 12:49 ?        00:00:00 [edac-poller]
root          93       2  0 12:49 ?        00:00:00 [devfreq_wq]
root          94       2  0 12:49 ?        00:00:00 [watchdogd]
root          96       2  0 12:49 ?        00:00:00 [kworker/0:1H-kblockd]
root          98       2  0 12:49 ?        00:00:17 [kswapd0]
root          99       2  0 12:49 ?        00:00:00 [ecryptfs-kthrea]
root         101       2  0 12:49 ?        00:00:00 [kthrotld]
root         102       2  0 12:49 ?        00:00:00 [acpi_thermal_pm]
root         103       2  0 12:49 ?        00:00:00 [scsi_eh_0]
root         104       2  0 12:49 ?        00:00:00 [scsi_tmf_0]
root         105       2  0 12:49 ?        00:00:00 [scsi_eh_1]
root         106       2  0 12:49 ?        00:00:00 [scsi_tmf_1]
root         108       2  0 12:49 ?        00:00:00 [vfio-irqfd-clea]
root         111       2  0 12:49 ?        00:00:00 [ipv6_addrconf]
root         120       2  0 12:49 ?        00:00:00 [kstrp]
root         123       2  0 12:49 ?        00:00:00 [zswap-shrink]
root         124       2  0 12:49 ?        00:00:00 [kworker/u7:0]
root         129       2  0 12:49 ?        00:00:00 [charger_manager]
root         153       2  0 12:49 ?        00:00:01 [kworker/1:1H-kblockd]
root         178       2  0 12:49 ?        00:00:00 [scsi_eh_2]
root         179       2  0 12:49 ?        00:00:00 [scsi_tmf_2]
root         183       2  0 12:49 ?        00:00:01 [kworker/2:1H-kblockd]
root         203       2  0 12:49 ?        00:00:00 [jbd2/sda5-8]
root         204       2  0 12:49 ?        00:00:00 [ext4-rsv-conver]
root         247       1  0 12:49 ?        00:00:00 /lib/systemd/systemd-journald
root         279       1  0 12:49 ?        00:00:00 /lib/systemd/systemd-udevd
root         283       2  0 12:49 ?        00:00:00 [loop0]
root         343       2  0 12:49 ?        00:00:00 [iprt-VBoxWQueue]
root         348       2  0 12:49 ?        00:00:00 [cryptd]
root         367       2  0 12:49 ?        00:00:01 [irq/18-vmwgfx]
root         371       2  0 12:49 ?        00:00:00 [ttm_swap]
root         372       2  0 12:49 ?        00:00:00 [card0-crtc0]
systemd+     584       1  0 12:49 ?        00:00:01 /lib/systemd/systemd-resolved
root         618       1  0 12:49 ?        00:00:00 /usr/lib/accountsservice/accounts-daemon
root         619       1  0 12:49 ?        00:00:00 /usr/sbin/acpid
avahi        622       1  0 12:49 ?        00:00:00 avahi-daemon: running [u2004zero.local]
message+     624       1  0 12:49 ?        00:00:03 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
root         626       1  0 12:49 ?        00:00:24 /usr/sbin/NetworkManager --no-daemon
root         636       1  0 12:49 ?        00:00:00 /usr/sbin/irqbalance --foreground
root         639       1  0 12:49 ?        00:00:00 /usr/bin/python3 /usr/bin/networkd-dispatcher --run-startup-triggers
root         643       1  0 12:49 ?        00:00:00 /usr/lib/policykit-1/polkitd --no-debug
syslog       647       1  0 12:49 ?        00:00:00 /usr/sbin/rsyslogd -n -iNONE
root         650       1  0 12:49 ?        00:00:02 /usr/lib/snapd/snapd
root         651       1  0 12:49 ?        00:00:00 /usr/libexec/switcheroo-control
root         658       1  0 12:49 ?        00:00:00 /lib/systemd/systemd-logind
root         659       1  0 12:49 ?        00:00:00 /usr/lib/udisks2/udisksd
root         662       1  0 12:49 ?        00:00:00 /sbin/wpa_supplicant -u -s -O /run/wpa_supplicant
avahi        673     622  0 12:49 ?        00:00:00 avahi-daemon: chroot helper
root         695       1  0 12:49 ?        00:00:00 /usr/sbin/inetutils-inetd
root         724       1  0 12:49 ?        00:00:00 /usr/sbin/cups-browsed
root         731       1  0 12:49 ?        00:00:00 /usr/sbin/ModemManager --filter-policy=strict
root         734       1  0 12:49 ?        00:00:00 /usr/sbin/cupsd -l
root         743       1  0 12:49 ?        00:01:49 /opt/piavpn/bin/pia-daemon
root         746       1  0 12:49 ?        00:00:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
root         747       1  0 12:49 ?        00:00:00 /usr/sbin/winbindd --foreground --no-process-group
root         754       1  0 12:49 ?        00:00:12 /usr/bin/containerd
root         805       1  0 12:49 ?        00:00:00 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
postgres     833       1  0 12:49 ?        00:00:00 /usr/lib/postgresql/14/bin/postgres -D /var/lib/postgresql/14/main -c config_file=/etc/postgresql/14/main/postgresql.conf
root         844       2  0 12:49 ?        00:00:00 bpfilter_umh
root         851     747  0 12:49 ?        00:00:00 winbindd: domain child [U2004ZERO]
postgres     878     833  0 12:49 ?        00:00:00 postgres: 14/main: checkpointer 
postgres     879     833  0 12:49 ?        00:00:00 postgres: 14/main: background writer 
postgres     880     833  0 12:49 ?        00:00:00 postgres: 14/main: walwriter 
postgres     881     833  0 12:49 ?        00:00:00 postgres: 14/main: autovacuum launcher 
postgres     883     833  0 12:49 ?        00:00:00 postgres: 14/main: stats collector 
postgres     884     833  0 12:49 ?        00:00:00 postgres: 14/main: logical replication launcher 
root        2731       1  0 12:49 ?        00:00:03 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
root        2735       1  0 12:49 ?        00:00:00 /usr/lib/ipsec/starter --daemon charon --nofork
whoopsie    2736       1  0 12:49 ?        00:00:00 /usr/bin/whoopsie -f
root        2744       1  0 12:49 ?        00:00:00 /usr/sbin/cron -f
kernoops    2756       1  0 12:49 ?        00:00:00 /usr/sbin/kerneloops --test
kernoops    2764       1  0 12:49 ?        00:00:00 /usr/sbin/kerneloops
root        2781       1  0 12:49 ?        00:00:00 /usr/sbin/xl2tpd
root        2789    2735  0 12:49 ?        00:00:00 /usr/lib/ipsec/charon
root        3249    2731  0 12:49 ?        00:00:00 /usr/bin/docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 3000 -container-ip 172.17.0.2 -container-port 3000
root        3263    2731  0 12:49 ?        00:00:00 /usr/bin/docker-proxy -proto tcp -host-ip :: -host-port 3000 -container-ip 172.17.0.2 -container-port 3000
root        3350       1  0 12:49 ?        00:00:00 /usr/bin/containerd-shim-runc-v2 -namespace moby -id b186d352f80cdecbe7d8ea5759074adbcc9a146f457ed333f4c3fe9cba8bd3f8 -address /run/containe
root        3427    3350  0 12:49 pts/0    00:00:00 /bin/bash
root        3535       1  0 12:49 ?        00:00:00 /usr/sbin/gdm3
root        3553       1  0 12:49 ?        00:00:02 /usr/sbin/VBoxService --pidfile /var/run/vboxadd-service.sh
root        3566    3535  0 12:49 ?        00:00:00 gdm-session-worker [pam/gdm-autologin]
u2004ze+    3590       1  0 12:49 ?        00:00:00 /lib/systemd/systemd --user
u2004ze+    3591    3590  0 12:49 ?        00:00:00 (sd-pam)
u2004ze+    3596    3590  0 12:49 ?        00:00:00 /usr/bin/pulseaudio --daemonize=no --log-target=journal
u2004ze+    3598    3590  0 12:49 ?        00:00:00 /usr/libexec/tracker-miner-fs
u2004ze+    3601       1  0 12:49 ?        00:00:00 /usr/bin/gnome-keyring-daemon --daemonize --login
u2004ze+    3605    3566  0 12:49 tty2     00:00:00 /usr/lib/gdm3/gdm-x-session --run-script env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
u2004ze+    3608    3590  0 12:49 ?        00:00:00 /usr/bin/dbus-daemon --session --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
u2004ze+    3610    3605  0 12:49 tty2     00:01:42 /usr/lib/xorg/Xorg vt2 -displayfd 3 -auth /run/user/1000/gdm/Xauthority -background none -noreset -keeptty -verbose 3
root        3681       1  0 12:49 ?        00:00:00 /usr/lib/upower/upowerd
u2004ze+    3708    3605  0 12:49 tty2     00:00:00 /usr/libexec/gnome-session-binary --systemd --systemd --session=ubuntu
u2004ze+    3818    3708  0 12:49 ?        00:00:00 /usr/bin/ssh-agent /usr/bin/im-launch env GNOME_SHELL_SESSION_MODE=ubuntu /usr/bin/gnome-session --systemd --session=ubuntu
u2004ze+    3971    3590  0 12:49 ?        00:00:00 /usr/libexec/at-spi-bus-launcher
u2004ze+    3976    3971  0 12:49 ?        00:00:00 /usr/bin/dbus-daemon --config-file=/usr/share/defaults/at-spi2/accessibility.conf --nofork --print-address 3
u2004ze+    3980    3590  0 12:49 ?        00:00:00 /usr/libexec/gnome-session-ctl --monitor
u2004ze+    3987    3590  0 12:49 ?        00:00:00 /usr/libexec/gnome-session-binary --systemd-service --session=ubuntu
u2004ze+    4001    3590  0 12:49 ?        00:01:32 /usr/bin/gnome-shell
u2004ze+    4032    3590  0 12:49 ?        00:00:00 /usr/libexec/at-spi2-registryd --use-gnome-session
u2004ze+    4037    4001  0 12:49 ?        00:00:00 ibus-daemon --panel disable --xim
u2004ze+    5205    5197  0 12:50 pts/0    00:00:00 bash
u2004ze+    5234    3987  0 12:50 ?        00:00:00 update-notifier
root        5251    5205  0 12:50 pts/0    00:00:00 sudo su
root        5257    5251  0 12:50 pts/0    00:00:00 su
root        5258    5257  0 12:50 pts/0    00:00:00 bash
root        5285    5258  0 12:52 pts/0    00:00:01 docker exec -it node-armanriazi /bin/bash
root        5303    3350  0 12:52 pts/1    00:00:00 /bin/bash
root        5403    5303  0 12:53 pts/1    00:00:00 node /opt/yarn-v1.22.15/bin/yarn.js start
root        5420    5403  0 12:53 pts/1    00:00:01 /usr/local/bin/node /home/node/app/substrate-front-end-template/.yarn/releases/yarn-3.1.1.cjs start
root        5431    5420  0 12:53 pts/1    00:00:00 /usr/local/bin/node /home/node/app/substrate-front-end-template/node_modules/react-app-rewired/bin/index.js start
root        5438    5431  0 12:53 pts/1    00:00:16 /usr/local/bin/node /home/node/app/substrate-front-end-template/node_modules/react-app-rewired/scripts/start.js
u2004ze+   25088    4001  0 13:52 ?        00:01:26 /opt/piavpn/bin/pia-client
root       27503       2  0 14:20 ?        00:00:01 [kworker/2:2-rcu_gp]
root       82028       2  0 16:18 ?        00:00:01 [kworker/0:0-events]
root       82133       2  0 16:18 ?        00:00:01 [kworker/1:2-events]
root       82779       2  0 16:21 ?        00:00:00 [kworker/1:3-cgroup_destroy]
root       83197       2  0 16:27 ?        00:00:00 [kworker/0:1-events]
root       83559       2  0 16:37 ?        00:00:00 [kworker/u6:1-events_unbound]
root       84293       2  0 17:03 ?        00:00:00 [kworker/u6:0-events_power_efficient]
root       84338       2  0 17:13 ?        00:00:00 [kworker/u6:2-events_unbound]
root       84348   34026  1 17:16 pts/1    00:00:01 ./target/release/node-template --dev --ws-external
root       84704   75818  0 17:18 pts/3    00:00:00 ps -ef
```

## Multi-Node Local Testnet

If you want to see the multi-node consensus algorithm in action, refer to our Start a Private Network tutorial.

Purge the development chain's state:

```
./target/release/node-template purge-chain --base-path /tmp/alice --chain local
./target/release/node-template purge-chain --base-path /tmp/bob --chain local
```

```
./target/release/node-template \
  --base-path /tmp/alice \
  --chain local \
  --alice \
  --port 30333 \
  --ws-port 9945 \
  --rpc-port 9933 \
  --unsafe-rpc-external \
  --rpc-methods=unsafe \
  --validator \
  --ws-external \
  --rpc-cors all  \
  --no-mdns \
  --name "Arman Riazi"  \
  --node-key 0000000000000000000000000000000000000000000000000000000000000001 



./target/release/node-template \
  --base-path /tmp/bob \
  --chain local \
  --bob \
  --port 30334 \
  --ws-port 9946 \
  --unsafe-rpc-external \
  --rpc-methods=unsafe \
  --rpc-port 9934 \
  --validator \
  --ws-external \
  --rpc-cors all  \
  --no-mdns  \
  --name "Arman Riazi 2"  \
  --bootnodes /ip4/192.168.8.110/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp

Other commands:

```
 subkey restore Alice
--telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' 
--pruning archive 
--prometheus-external
--chain local
--tmp
--dev 
--fir
--base-path ./my-chain-state 
--enable-offchain-indexing true
```

The private network substrate  was made by manifest:

![polkadot-js](https://polkadot.js.org/apps/#/settings?rpc=ws://192.168.8.110:9945) 
![cloudflare-ipfs](https://cloudflare-ipfs.com/ipns/dotapps.io/#/explorer)


<details>
<summary>Node Setup -Run Command And UI 1</summary>
<img src="https://armanriazi.github.io/site/assets/attachments/node-setup1.JPG"width="650" height="650" />
</details>    
<details>
<summary>Node Setup -Run Command And UI 2</summary>
<img src="https://armanriazi.github.io/site/assets/attachments/node-setup3.JPG"width="650" height="650" />
</details> 
<details>
<summary>Node Setup -Run Command And UI 3</summary>
<img src="https://armanriazi.github.io/site/assets/attachments/node-setup4.JPG"width="650" height="650" />
</details>      



```
   {
      "AccountInfo": "AccountInfoWithTripleRefCount",
      "Address": "AccountId",
      "LookupSource": "AccountId",
      "AccountInfo": "AccountInfoWithDualRefCount",
      "ContinuousAccountData": {
        "principal": "u64",
        "deposit_date": "BlockNumber"
      },
      "U16F16": "[u8; 4]",
      "GroupIndex": "u32",
      "ValueStruct": {
        "integer": "i32",
        "boolean": "bool"
      },
      "BufferIndex": "u8",
      "AccountIdOf": "AccountId",
      "BalanceOf": "Balance",
      "FundInfoOf": "FundInfo",
      "FundInfo": {
        "beneficiary": "AccountId",
        "deposit": "Balance",
        "raised": "Balance",
        "end": "BlockNumber",
        "goal": "Balance"
      },
      "FundIndex": "u32",
      "InnerThing": {
        "number": "u32",
        "hash": "Hash",
        "balance": "Balance"
      },
      "SuperThing": {
        "super_number": "u32",
        "inner_thing": "InnerThing"
      },
      "InnerThingOf": "InnerThing"
    }
```

> Try  introductory tutorial for creating your first runtime module 

<iframe width="700" height="396" src="https://www.youtube.com/embed/0IoUZdDi5Is" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

📚📚📚

## Literature

[Error-Rust-Lang](https://doc.rust-lang.org/error-index.html)

[Rustup](https://rust-lang.github.io/rustup/examples.html)

[Start-a-private-network](https://core.tetcoin.org/docs/en/tutorials/start-a-private-network)

[Substrate-based-chain](https://docs.deip.world/develop/substrate-based-chain)

[Substrate-Glossary](https://docs.substrate.io/v3/getting-started/glossary/)

❤️❤️❤️

If you liked this article or if it helped you please clap on this post to help the Read.Cash algorithm recommend it to more people. If you have any questions or remarks please feel free to leave a comment below.

Alternatively, please feel free to send donations 
> 0xde5D732a5AB44832E1c69b18be30834639F44A2c

❤️❤️❤️

Reseacher & Organized by:

🙏Arman-Riazi🤝

[[Polkadot-Ecosystem-Research]]

[[Substrate]]