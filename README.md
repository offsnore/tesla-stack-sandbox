## tesla-stack - Elastic stack sandbox implementation going along side a Tesla project implementation
=======
## Tesla Project - Elastic Stack the Model 3

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


## Coming Soon

The more development continues of the Tesla Stack, the more ideas for work and improvement tend to come. A quick list of items I hope to get to shortly, in lieu of ramping up full fledged GH Issues, PRs, your contributions, etc. Here's an idea:

- Scripted snapshots, backups, restores to various storage mechanisms
- Configurable tiers and cluster design at startup
- Multi-cluster configuration and startup, cross cluster search, replication testing
- Demonstration of impact to performance in a given stack of architectural configuration, decisions



