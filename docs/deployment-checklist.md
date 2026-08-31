# Warehouse AMR Deployment Checklist and Runbook

A practical checklist and runbook for deploying collaborative AMRs in a mid-market 3PL e-commerce warehouse. Built to complement the PRD (`prd-warehouse-amr-deployment.md`) and integration architecture (`integration-architecture.md`).

## Pre-deployment checklist

### Site readiness
- [ ] Floor survey confirms flat, clean surfaces in robot operating zones.
- [ ] No ramps, uneven joints, or high-traffic human corridors conflict with planned paths.
- [ ] Wi-Fi coverage tested end-to-end; latency <50ms, no dead zones.
- [ ] Redundant Wi-Fi access points in high-density zones and near charging stations.
- [ ] Power outlets available for charging stations and supervisor stations.
- [ ] Charging station locations finalized and marked.
- [ ] Emergency stop buttons and light curtains installed where required.
- [ ] Safety signage posted for robot zones, speed limits, and right-of-way rules.

### WMS and integration
- [ ] WMS version and API surface documented.
- [ ] Data mappings for orders, inventory, SKU master, and locations confirmed.
- [ ] Order wave format and release cadence agreed.
- [ ] Pick confirmation format and exception format agreed.
- [ ] Integration test plan written and reviewed.
- [ ] Sandbox or staging environment available for testing.
- [ ] Rollback plan defined if WMS integration fails during go-live.

### Vendor and contract
- [ ] Robot hardware, fleet manager software, and support scope documented.
- [ ] Pricing model (RaaS, lease, or purchase) and payment terms confirmed.
- [ ] SLA for robot uptime, support response time, and spare parts delivery confirmed.
- [ ] Training plan and training materials reviewed.
- [ ] Exit clauses and decommissioning terms understood.
- [ ] Local support presence in Southeast Asia confirmed (if applicable).

### People and process
- [ ] Project sponsor and steering committee identified.
- [ ] Pilot team (supervisors, pickers, IT) selected and briefed.
- [ ] SOPs drafted for normal picking, batch picking, replenishment, and exception handling.
- [ ] Shift schedules adjusted for pilot training and parallel operation.
- [ ] Communication plan for associates and customers defined.

## Pilot deployment checklist

### Week 1-2: Setup
- [ ] Robots unboxed, inspected, and charged.
- [ ] Fleet manager installed and accessible on the warehouse network.
- [ ] Robot fleet connected to fleet manager; all robots show healthy status.
- [ ] WMS integration configured in sandbox.
- [ ] Test order wave released from WMS to fleet manager.
- [ ] First robot task executed in a closed test zone.
- [ ] Supervisor dashboard configured and tested.
- [ ] Exception handling workflow tested with simulated events.

### Week 3: Training
- [ ] Pilot pickers trained on robot interaction and safety.
- [ ] Supervisors trained on dashboard, overrides, and alerting.
- [ ] IT team trained on fleet manager administration and logs.
- [ ] Training completion recorded and signed off.

### Week 4: Pilot go-live
- [ ] Pilot zone isolated or clearly marked.
- [ ] Parallel manual picking process active for comparison.
- [ ] Real order waves routed to pilot zone.
- [ ] Daily standup to review throughput, accuracy, and issues.
- [ ] Baseline metrics collected for pick rate, accuracy, and labor hours.
- [ ] First issue log created and maintained.

## Expansion checklist

- [ ] Pilot targets met (throughput +20%, accuracy improvement, uptime >99%).
- [ ] Lessons learned from pilot documented.
- [ ] Expansion plan for additional zones approved.
- [ ] Additional robots and charging stations installed.
- [ ] Remaining associates trained in waves.
- [ ] Full WMS integration cutover from parallel fallback.
- [ ] Reporting dashboards reviewed by operations manager.
- [ ] Customer-facing capacity and SLA commitments updated.

## Operational checklist (daily)

- [ ] Fleet manager status is healthy; no active alerts.
- [ ] All robots are charged and ready for shift.
- [ ] First order wave is released and tasks are allocated.
- [ ] Supervisor dashboard is open and staffed.
- [ ] Exception queue is monitored; no backlog >10 minutes.
- [ ] Battery levels are monitored; robots are sent to charge before critical levels.
- [ ] End-of-shift reconciliation between WMS and fleet manager completed.
- [ ] Any incidents or near-misses are logged.

## Operational checklist (weekly)

- [ ] Review throughput, accuracy, and uptime trends.
- [ ] Review top exception types and root causes.
- [ ] Check robot maintenance logs and schedule preventive maintenance.
- [ ] Review picker performance and feedback.
- [ ] Update SOPs based on observed issues.
- [ ] Confirm vendor support ticket status and spare parts inventory.
- [ ] Report progress to operations manager and steering committee.

## Operational checklist (monthly)

- [ ] Calculate ROI: labor cost per pick, temp labor reduction, SLA improvement.
- [ ] Review SKU velocity and slotting recommendations.
- [ ] Audit security and access logs.
- [ ] Review contract and SLA compliance with vendor.
- [ ] Plan for capacity or layout changes.
- [ ] Update deployment playbook with new learnings.

## Failure runbook

### Robot will not move or respond
1. Check robot battery level in dashboard. If low, send to charging station.
2. Check Wi-Fi signal at robot location. If weak, move robot or adjust access point.
3. Check for obstacles, spills, or debris blocking path.
4. Restart robot via supervisor dashboard if safe. If still unresponsive, place robot in manual maintenance mode and call vendor support.
5. Reassign task to another robot. Log incident.

### Pick confirmation not reaching WMS
1. Check fleet manager status and WMS sync status.
2. Inspect message queue or API logs for errors.
3. If integration is down, stop releasing new waves. Let robots finish current tasks.
4. Switch to manual fallback for new waves.
5. Reconcile pending pick confirmations when integration is restored.
6. Escalate to IT and vendor support.

### High exception rate during a shift
1. Check top exception types in dashboard (missing SKU, wrong SKU, damaged, location mismatch).
2. If missing SKU is dominant, verify inventory accuracy and slotting.
3. If wrong SKU is dominant, verify barcode scanning process and SKU master data.
4. If location mismatch is dominant, check for recent layout changes or WMS location sync errors.
5. Pause wave release for affected zone until root cause is addressed.
6. Brief supervisors and update SOPs.

### Fleet manager is unreachable
1. Verify network connectivity and firewall status.
2. Check fleet manager server/container status.
3. If cloud-hosted, verify vendor status page.
4. If outage expected >5 minutes, switch to manual picking for all zones.
5. Robots complete current tasks and return to charging stations.
6. Communicate downtime to shift supervisors and operations manager.
7. Restore service, reconcile state, then resume wave release.

### Safety incident or near-miss
1. Immediately stop the robot involved using emergency stop or dashboard.
2. Secure the area and attend to any personnel first.
3. Document incident with time, location, robot ID, and witness statements.
4. Notify safety officer and operations manager.
5. Do not return robot to service until incident review is complete.
6. Review safety procedures and retrain affected staff if needed.

### Battery fire or smoke
1. Evacuate personnel immediately.
2. Use only appropriate Class D or lithium-ion fire extinguisher if trained.
3. Call emergency services.
4. Do not attempt to move the robot if it is smoking or hot.
5. Isolate the area and prevent re-entry until declared safe.
6. Document incident and notify vendor.

## Rollback criteria

If the deployment fails to meet pilot targets, consider rollback or pause:
- Throughput improvement <10% after 4 weeks.
- Order error rate increases for more than one week.
- Robot uptime <95% for two consecutive weeks.
- Safety incident caused by system design flaw.
- WMS integration cannot be stabilized.
- Vendor support is unresponsive or unable to resolve critical issues.

Rollback plan:
1. Stop releasing new waves to AMR fleet.
2. Return all robots to charging stations.
3. Switch all zones to manual RF or paper picking.
4. Notify operations manager and customers of temporary SLA impact.
5. Work with vendor to define remediation plan before resuming.

## Tools and references

- PRD: `prd-warehouse-amr-deployment.md`
- Integration architecture: `integration-architecture.md`
- Case study: `case-study-walmart-symbotic.md`
- Vendor matrix: `vendor-matrix.md`
