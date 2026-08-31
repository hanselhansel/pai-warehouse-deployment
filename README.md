# Warehouse Physical AI Deployment

Owned Physical AI portfolio project focused on product, deployment, integration, and solutions engineering for warehouse, logistics, and mid-market 3PL automation.

## Portfolio purpose

This project builds evidence that Hansel can connect warehouse business requirements to AMR product decisions, WMS integration, deployment operations, and fleet-orchestration systems.

Current portfolio entry point: [physical-ai-foundation](https://github.com/hanselhansel/physical-ai-foundation). The approved destination is `physical-ai-portfolio`; the current URL remains authoritative until migration verification.

## Current status

- Workflow status: Active as a portfolio project
- Written artifacts: Seven core deployment artifacts exist
- Runtime evidence: Open-RMF environment is scaffolded but unvalidated
- Contribution evidence: One upstream warehouse AMR documentation PR is open
- Next decision: Complete the portfolio reorganization, then write a flagship experiment charter
- Candidate experiment: Open-RMF office demo or a stronger warehouse-specific alternative

The project does not claim that Open-RMF has run successfully on this Mac.

## Learning goals

- Evaluate warehouse automation categories and vendors against real workflows.
- Translate 3PL operating needs into product requirements and acceptance criteria.
- Design WMS-to-fleet integration, exception handling, and observability.
- Understand deployment sequencing, safety, human factors, and rollback.
- Test fleet orchestration concepts through reproducible runtime experiments.

## Non-goals

- Robot-policy training.
- Hardware purchase or physical warehouse pilot in the current cycle.
- Treating simulation output as proof of production deployment readiness.
- Publishing quantitative claims without source validation.

## Contents

- [Vendor matrix](docs/vendor-matrix.md)
- [Walmart and Symbotic case study](docs/case-study-walmart-symbotic.md)
- [Mid-market 3PL AMR product requirements](docs/prd-warehouse-amr-deployment.md)
- [WMS and AMR fleet integration architecture](docs/integration-architecture.md)
- [Deployment checklist and failure runbook](docs/deployment-checklist.md)
- [Warehouse AMR deployment playbook](docs/playbook.md)
- [AMR fleet-orchestration analysis](docs/amr-fleet-orchestration.md)
- [Open-RMF Mac and Docker runbook](RUNBOOK_OPENRMF.md)
- [Open-RMF office demo guide](sim/open-rmf-office-demo/README.md)
- [Open-RMF observation record](sim/open-rmf-office-demo/office-demo-notes.md)

## Reproduction entry points

- ROS 2 container: [docker/README.md](docker/README.md)
- Open-RMF container: [docker/open-rmf/README.md](docker/open-rmf/README.md)
- End-to-end Open-RMF runbook: [RUNBOOK_OPENRMF.md](RUNBOOK_OPENRMF.md)

These are current scaffolding entry points. The Open-RMF runbook requires a separate current-practice repair before runtime execution.

## Scope

Focus: warehouse / logistics / 3PL.
Vendors of interest: Symbotic, AutoStore, Locus Robotics, 6 River Systems, Exotec.

## Evidence authority

Detailed artifacts, runtime logs, screenshots, and experiment results are authoritative in this repository. The Portfolio repository holds only concise summaries and links.
