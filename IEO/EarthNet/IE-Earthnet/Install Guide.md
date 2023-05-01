# EarthNet::IEO - Open source EarthNet lobby server

## Server Capabilities

**Functioning**
* Main Lobby
* Game Lobbies
* Custom Channels
* Access Control via Game Versioning.

**Non-Functional**
* Accounts
* Account Info
* Player Stats
* Ladder
* Weekly Ladder
* Monthly Ladder
* Help

## Installation
cd /etc/ie-earthnet
Install `rust` and `cargo`: go to [rustup.rs](https://rustup.rs) and follow the instructions.
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
> 1
```

reload ssh session

Downgrade Rust to version [1.46.0](https://github.com/rust-lang/rust/releases/tag/1.46.0)
```
rustup default 1.46.0
```
or if you just want to download it, instead of using it as a default
```
rustup install 1.46.0
```

Clone IE-Earthnet Code
```
cd /etc
git clone https://github.com/InsideEarth2150/EarthNet-IEO.git
```

To build IE::Net, type
```
cargo build
```

To run IE::Net, type
```
cargo run
```

## Configuration

By default, IE::Net listens on all addresses at port 17171 (default EarthNet port).
You can change the listen address and port by passing a command line argument:
```
cargo run -- --bind 10.21.0.1:17171
```

## Autostart on server load

```
touch /etc/network/Earthnet
chmod +x /etc/network/Earthnet
nano /etc/network/Earthnet
```
insert into /etc/network/Earthnet
```
#!/bin/sh

cd / \
cd /etc/ie-earthnet/ \
cargo run -- --bind 10.21.0.1:17171 &> /etc/ie-earthnet/logs/server.log
```

# Check its running
```
ps aux | grep "Earthnet"
ps aux | grep "ie_net"
```

# to kill
```
pkill ie_net
```

## Cookbooks
* [Rust Cookbook - GitHub Pages](https://rust-lang-nursery.github.io/rust-cookbook/)
* [The Cargo Book - Rust](https://doc.rust-lang.org/cargo/commands/cargo-run.html)

## Recompile IE Net
* rename target folder and then cargo run again
```
mv target/ targetBU/
```

## Misc
* To unistall rust
```
rustup self uninstall
```

## Known Issues

**Error - Compiling arrayvec v0.5.1 # https://github.com/rust-lang/rust/issues/81654
error[E0308]: mismatched types

* fix
```
cargo update -p lexical-core
```


**Error - INFO [ie_net] IE::Net server starting up...
INFO [ie_net::broker] Main server loop starting up
ERROR [ie_net::server] Task accept_loop exited with error: Invalid argument (os error 22)
INFO [ie_net::server] Shutting down server
thread 'main' panicked at 'unexpected task state', /root/.cargo/registry/src/github.com-1ecc6299db9ec823/tokio-0.2.22/src/runtime/task/core.rs:220:22

* fix
```cargo update -p tokio
```