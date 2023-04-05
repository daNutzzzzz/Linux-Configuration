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

Install `rust` and `cargo`: go to [rustup.rs](https://rustup.rs) and follow the instructions.
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Clone IE-Earthnet Code
```
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
cargo run -- --bind 192.168.1.1:12345
```





## Knowen Issues

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