## Tesla Project - Elastic Stack the Model 3

### tesla-stack - Elastic stack sandbox implementation going along side a Tesla project implementation
This project is borne of tinkering and scripting with the Elastic stack primarily to build a contrived infrastructure platform for sandbox style architecture and performance testing:
- Cluster design
- Cluster architecgture
- Elasticsearch cluster nodes
- Hot-warm - Tiers of nodes with disk and memory characteristics mimicking infrastructure performances of differing orders of magnitude
- Multi-node cluster design and implications, practical management via scripts and API calls
- Cross cluster search (CCS)
- Cross cluster repclication (XDCR)
- Backups, Snapshots, Restores to various mediums (S3, Minio, local mounts)
- SLA and performance testing, retention period

## Topics Labbed Out 

- Pulling data from first TeslaFi and then direct from Tesla APIs
- CSV input file parsing
- JSON file input parsing
- JSON multi-line parsing
- multi-table/collection ingest
- Ingest into local cluster
- Ingest into public cloud cluster
- Demonstrating joins, dashboards, monitoring and alerting on index and cluster data

## Overview And Specific Projects

Individual project ideas and forks come first from the `elastic-stack` project - meant as a script to download the stack to a given operating system (OS) environment. The initial `tesla-stack` project leverates `elastic-stack` to assume the binary directory structure and symlinks, and version labels are properly downloaded and built. Configuration files and paths follow a common structure meant to ease the complexity of dealing with potentially a full stack of binaries to download and deploy to a given server. 

Other projects will be added as they are invisioned or requested, or developed as POCs from the field.   

- tesla-stack
- astronomical-stack
- inventory-join-stack

## Getting Started

### Environment Variables

Environment Vars are used throughout this stack as a means of minimzing hardcoded values of arbitrary metadata that changes frequently and is usually used to track distributables. 

### Symlinks

In addition to using environment variables throughout the increase the automation and ease of maintenance and use, symlinks are used, were possible, to obfuscate the hardcoded directory names, which usually include meta information like version, date, or build numbers. 


### Stack Installation

First, ensure that the base environment variable is set in the bash prompt of the server's terminal:

1. Type `cd` to get to your home directory: `~`
1. Create `workspace` directory if it doesn't exist
1. Type `cd workspace`

Do it all at once version (using `git clone`): 
```
cd 
if [ -f workspace ]; then 
  mkdir workspace
fi
cd workspace
# git clone .. elastic-stack
`git clone git@github.com:evalcrux/elastic-stack.git`

cd elastic-stack
./install-stack-components.sh
./install-stack-env-vars.sh
./install-stack-symlinks.sh

```

Once the Elastic stack project is installed, switch over to the tesla-stack project, which works in conjunction with the binaries downloaded and stored in `elastic-stack` project. 
```
cd
cd workspace
# git clone .. tesla-stack
git clone git@github.com:evalcrux/tesla-stack.git
cd tesla-stack
cd dev-ops
```

`$ export ES_STACK_VERSION=6.5.4`
`$ echo $ES_STACK_VERSION`



Alternatively, use the tesla-stack `dev-ops/install-stack.sh` script to go into the `~/workspace/elastic-stack` directory and execute the download scripts (binaries, env vars, symlinks)

## Output from the Tesla Stack Project

Findings and tests, contrived and practical, will be created, documented, and performed againsta a variety of infrastructures. This project will attempt to maintain organization and track of the various pieces. By no means is this an offer to submit an issue looking to get your work done. But if it's cool, I'll add it here as a method of organizing the chaos of the various stacks encountered along the way. 


## Contributing

Contribute to this and your own stacks, publish them, PR them, merge them. Then find standard language to fill this block out more. 

## Coming Soon

The more development continues of the Tesla Stack, the more ideas for work and improvement tend to come. A quick list of items I hope to get to shortly, in lieu of ramping up full fledged GH Issues, PRs, your contributions, etc. Here's an idea:

- Scripted snapshots, backups, restores to various storage mechanisms
- Configurable tiers and cluster design at startup
- Multi-cluster configuration and startup, cross cluster search, replication testing
- Demonstration of impact to performance in a given stack of architectural configuration, decisions, and tradeoffs
- Generating certificates and security roles, users



