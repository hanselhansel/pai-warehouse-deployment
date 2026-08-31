# Warehouse AMR Deployment Playbook

A practical guide for product managers, deployment engineers, and solutions teams evaluating or launching collaborative AMR automation in a warehouse.

This playbook is built from five artifacts in this repo:
- Vendor matrix: `vendor-matrix.md`
- Case study: `case-study-walmart-symbotic.md`
- PRD: `prd-warehouse-amr-deployment.md`
- Integration architecture: `integration-architecture.md`
- Deployment checklist: `deployment-checklist.md`

Use this when you are deciding whether to deploy robots, choosing a vendor, or running a pilot.

## The one-sentence decision framework

Start with the problem, not the robot. The best deployments reduce walking distance, improve pick accuracy, and make labor more flexible. If your operation does not have clear walking, accuracy, or labor volatility pain, robots are unlikely to pay back.

## Step 1: Pick the right automation category

| If your operation looks like this | Consider this category | Example vendors |
|---|---|---|
| Large RDC, high case volume, 15-year capital horizon, end-to-end case handling | Full-stack system | Symbotic |
| Dense e-commerce storage, high SKU count, brownfield, proven uptime | Cube storage / goods-to-person | AutoStore, Exotec |
| Fast, incremental piece-picking, low infrastructure, flexible layout | Collaborative AMR | Locus Robotics, 6 River Systems |
| Mixed piece and case handling with flexible rack layout | 3D mobile goods-to-person | Exotec |

For mid-market 3PLs and e-commerce fulfillment centers, collaborative AMRs are usually the right starting point. They deploy fast, require little fixed infrastructure, and let you test automation before committing to a full system.

## Step 2: Define the business case before talking to vendors

Vendors will sell you on robot speed, battery life, and AI coordination. Your job is to translate those specs into operational and financial outcomes.

Document the following baseline metrics before the first vendor demo:

- Average walking distance per picker per shift.
- Units picked per labor hour today.
- Order error rate and error cost.
- Temp labor hours and cost during peak weeks.
- Peak-to-average order ratio.
- WMS integration capability (APIs, files, real-time latency).
- Floor condition and Wi-Fi coverage.

Without these numbers, you cannot evaluate vendor claims or set pilot acceptance criteria.

## Step 3: Run the vendor evaluation

Use a structured matrix. The five vendors in this repo cover the main categories. Score each vendor on these dimensions:

1. **Deployment speed.** Weeks to pilot go-live, months to full deployment.
2. **Capital model.** Purchase, lease, RaaS, or full system sale. Match to your balance sheet and risk appetite.
3. **Integration surface.** How does the fleet manager connect to your WMS? APIs, files, message queues? Is there a sandbox?
4. **Uptime and support.** SLA, local support presence, spare parts logistics, response time.
5. **Scalability.** Maximum fleet size per facility, multi-fleet orchestration, and layout flexibility.
6. **Human factors.** Training time, associate ergonomics, supervisor tooling, and exception handling.
7. **Exit terms.** What happens if the pilot fails? Can you remove the robots without writing off fixed infrastructure?

Never buy a system because of a single impressive demo. Buy it because the deployment model, integration, and support fit your operation.

## Step 4: Design the pilot for learning, not just ROI

A pilot that only chases a quick ROI number will teach you less than a pilot designed to expose failure modes.

Pick a pilot zone with these properties:
- High enough volume to show real throughput.
- Stable enough SKU profile to avoid data chaos.
- Walking-distance pain that the robot can actually solve.
- A supervisor and team willing to log issues daily.

Set four targets for the pilot:
1. **Throughput target.** Increase units picked per labor hour by 20-40%.
2. **Accuracy target.** Reduce order error rate by 15-25%.
3. **Uptime target.** Keep robot fleet above 99% uptime.
4. **Learning target.** Identify the top 5 failure modes and fix the top 3 before expansion.

Run parallel manual picking for comparison. This protects you if the integration fails and gives you a clean baseline.

## Step 5: Treat integration as the real project

The robot hardware is the visible part. The integration is where deployments live or die.

Key integration workstreams:

- **WMS data sync.** Orders, inventory, SKU master, and locations must flow accurately and quickly. Bad data destroys throughput.
- **Order wave design.** The robot is only as efficient as the wave released to it. Wave too early and inventory changes; wave too late and robots wait.
- **Exception handling.** Missing SKUs, wrong barcodes, and damaged items will happen. Define the resolution path, the WMS write-back, and the supervisor alert before go-live.
- **Network and safety.** Wi-Fi must be reliable. Robot zones must be safe. Emergency stops and human-right-of-way rules must be clear.
- **Observability.** You need throughput, accuracy, uptime, and exception dashboards from day one. Without them, you cannot tune or defend the project.

Plan for the WMS integration to take longer than the robot installation. It usually does.

## Step 6: Roll out in phases

A typical 12-week rollout for a collaborative AMR in a 50,000 sq ft facility:

- **Week 1:** Design pilot zone, confirm WMS mappings, install fleet manager.
- **Weeks 2-4:** Pilot go-live with 20-30 robots, run parallel manual picking, tune task allocation.
- **Weeks 5-10:** Expand zone by zone, train associates in waves, remove parallel fallback.
- **Weeks 11-12:** Lock SOPs, finalize reporting, document ROI, plan next phase.

Do not skip the parallel fallback. It is your insurance policy.

## Step 7: Operate like a service, not a hardware installation

After go-live, the work is ongoing operations and continuous improvement.

Daily:
- Check fleet health and battery levels.
- Monitor exception queue and resolution time.
- Reconcile WMS and fleet manager state at end of shift.

Weekly:
- Review throughput, accuracy, and uptime trends.
- Identify top exception types and fix root causes.
- Update SOPs based on observed issues.

Monthly:
- Calculate ROI and compare to business case.
- Review SKU slotting and velocity recommendations.
- Audit security and access logs.
- Update this playbook with new learnings.

## Step 8: Know when to stop or pivot

Roll back or pause if any of these are true for more than two weeks:
- Throughput improvement is below 10%.
- Order error rate has increased.
- Robot uptime is below 95%.
- A safety incident is caused by a system design flaw.
- Vendor support is unresponsive on critical issues.

A failed pilot is a good outcome if you learn fast and cheaply. A failed full rollout is expensive.

## Common mistakes

1. **Buying the robot before understanding the workflow.** Map the workflow first.
2. **Ignoring SKU master data.** This is usually the biggest hidden risk.
3. **Underestimating WMS integration.** It is often 50% of the effort.
4. **Skipping the parallel fallback.** You need a baseline and a safety net.
5. **Measuring robot speed instead of labor productivity.** Robots that move fast but wait for tasks are not productive.
6. **Forgetting associate training and ergonomics.** A robot that pickers hate will fail.
7. **Treating go-live as the finish line.** It is the start of operations and tuning.

## When this playbook does not apply

This playbook is for collaborative AMR deployments in warehouses with human pickers, existing WMS, and mid-market scale. It does not cover:
- Full greenfield automation systems (see Symbotic case study).
- Fixed cube-storage systems (see AutoStore / Exotec profiles).
- Manufacturing or assembly line robotics.
- Outdoor or unstructured logistics (yards, ports, last-mile delivery).

## Next steps

1. Pick your pilot zone and capture baseline metrics.
2. Run the vendor matrix for your shortlist.
3. Write your pilot acceptance criteria before the first vendor demo.
4. Build the integration test plan before hardware arrives.
5. Start the pilot with a parallel fallback and a clear learning agenda.

---

Best regards, Hansel Hansel

## Sources and related artifacts

- Vendor matrix: `vendor-matrix.md`
- Walmart + Symbotic case study: `case-study-walmart-symbotic.md`
- AMR PRD: `prd-warehouse-amr-deployment.md`
- Integration architecture: `integration-architecture.md`
- Deployment checklist: `deployment-checklist.md`
- Research sources: Symbotic Q3 2026 earnings, AutoStore Q2 2026 results, Robotomated, Supply Chain Research, Murat's Lab field notes, Exotec product announcements.
