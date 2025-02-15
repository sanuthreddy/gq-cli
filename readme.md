# GoQuant CLI Tool

## Introduction
This tool provides a simplified interface for controlling the GoQuant (gq) service stack. You can quickly start, stop, or restart all related services using minimal commands, making development and deployment smoother and more efficient.

To add gq script to /usr/bin/local execute the setup.sh script from the gq-cli folder
```
./setup.sh
```
## Usage

When you run `gq -h` or `gq --help`, you will see the following usage information:

```
###############################################################################
#
# Usage:
#   gq <operation> [dev-mode] [build-options] [log-options]
#
# Operations:
#   -a, --auth           Generate SSH key for Git authentication
#   -i, --init           Install dependencies
#   -sg, --setup-gotrade  Setup GoTrade environment
#   -up, --start         Start all services
#   -r, --run-oems       Run OEMS only
#   -down, --stop        Stop all services
#   clone [repo]         Clone repository (default: gq-cli or specified repo)
#
# Development Modes (use with -up):
#   -rd, --remote-dev    Run OEMS in remote-dev mode
#   -s,  --standard-dev  Run OEMS in standard-dev mode
#   -f,  --full-stack    Run full stack in default mode
#
# Build Options (use with -up only):
#   -c, --compile-oems   Toggle OEMS compilation
#   -g, --build-gq       Toggle GQ packages build (NOT allowed for remote-dev)
#   -w, --reset           Toggle data reset
#   -bf, --build-frontend Toggle frontend build
#
# Log Options:
#   -loem1, --log-oems1     Toggle OEMS1 logs
#   -loem2, --log-oems2     Toggle OEMS2 logs
#   -lapi, --log-fastapi   Toggle FastAPI logs
#   -lui, --log-frontend  Toggle frontend logs
#
# Examples:
#   gq -i
#   gq --auth
#   gq -sg
#   gq clone gq-deribit-gateway-cpp    # Clone the repo using the name"
#   remote dev mode - run only oems in remote dev only
#   gq -rd -c        # Compile and run OEMS in remote-dev mode
#   gq -rd -r        # Run existing OEMS executable in remote-dev mode
#   gq -up -f             # Start full stack
#   gq -up -f -bf -lapi -lui -loem1   # Start full stack with all builds
#   gq -down
#   standard dev mode - run the oems only
#   gq -up -s             # Just run existing OEMS executable
#   gq -up -s -c          # Compile and run OEMS
#   gq -up -s -g          # Build GQ packages and run OEMS
#   gq -up -s -g -c       # Build GQ packages, compile OEMS, then run it
#   gq -up -s -loem1         # Run OEMS with logging enabled
#   gq -up -s -c -loem1      # Compile and run OEMS with logging enabled
###############################################################################
```

### Operations

- **`-i, --init`**:           Installs all required dependencies for the gq tool and its services.
- **`-a, --auth`**:           Generate SSH key for Git authentication.
- **`-up, --start`**:         Starts all services in the gq stack.
- **`-sg, --setup-gotrade`**: Setup GoTrade environment.
- **`-r, --run-oems`**:       Run OEMS only.
- **`-down, --stop`**:        Stops all services in the gq stack.

### Development Modes (use with `-up`)

- **`-rd, --remote-dev`**:    Run OEMS in remote-dev mode.  
  *Note: You cannot use `-g` (build-gq) with remote-dev.*
- **`-s, --standard-dev`**:   Run OEMS in standard-dev mode.
  *Note: If the developer has access to both gq-dev-v3-cpp and gq-gotrade-cpp*
- **`-f, --full-stack`**:     Run full stack in default mode.

### Build Options (use with `-up` only)

- **`-c, --compile-oems`**:      Toggle OEMS compilation.
- **`-g, --build-gq`**:          Toggle building GQ packages.  
  *Not allowed for remote-dev.*
- **`-w, --wipe`**:              Toggle data wiping. This might remove existing data volumes or cached data.
- **`-bf, --build-frontend`**:   Toggle building the frontend application.

### Log Options

- **`-loem1, --log-oems1`**:     Toggle logs for OEMS1.
- **`-loem2, --log-oems2`**:     Toggle logs for OEMS2.
- **`-lapi, --log-fastapi`**:    Toggle logs for FastAPI.
- **`-lui, --log-frontend`**:    Toggle logs for the frontend.

---

**## Examples**
1. **Install dependencies**
```bash
gq -i
```
2. **Generate SSH key for Git authentication**
```bash
gq --auth
```
3. **Setup GoTrade environment**
```bash
gq -sg
```
4. **Remote Dev Mode (OEMS only)**
```bash
Compile and run OEMS in remote-dev mode
gq -rd -c
Run existing OEMS executable in remote-dev mode
gq -rd -r
```
5. **Full Stack Operations**
```bash
Start full stack
gq -up -f
Start full stack with frontend build and logging
gq -up -f -bf -lapi -lui -loem1
Stop all services
gq -down
```
6. **Standard Dev Mode (OEMS only)**
```bash
Just run existing OEMS executable
gq -up -s
Compile and run OEMS
gq -up -s -c
Build GQ packages and run OEMS
gq -up -s -g
Build GQ packages, compile OEMS, then run it
gq -up -s -g -c
Run OEMS with logging enabled
gq -up -s -loem1
Compile and run OEMS with logging enabled
gq -up -s -c -loem1
```