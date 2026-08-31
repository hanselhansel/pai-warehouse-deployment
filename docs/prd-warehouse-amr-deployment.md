# Product Requirements Document: AMR Deployment for a Mid-Market 3PL E-Commerce Warehouse

## Context

This PRD defines a warehouse robot deployment for a hypothetical mid-market third-party logistics (3PL) provider in Southeast Asia running a 50,000 sq ft e-commerce fulfillment center. The provider processes 10,000-15,000 orders per day, has high SKU volatility, and relies on seasonal temp labor that is unreliable during peak.

The chosen technology is a collaborative AMR fleet (person-to-goods model) rather than a fixed cube-storage system or full-stack automation. This matches the operation's need for fast deployment, low capital commitment, and flexibility.

## Problem

1. Pickers spend 60-70% of their shift walking between locations, not picking.
2. Peak-season staffing is unpredictable and expensive, causing SLA misses.
3. Order accuracy is manually dependent and degrades under fatigue and turnover.
4. Existing WMS is functional but not tightly integrated with labor optimization tools.
5. Warehouse layout changes frequently as new customers and SKUs are onboarded.

## Target users

| User | Role in deployment | Pain point | Success metric |
|---|---|---|---|
| Warehouse associate | Follows robot to pick locations, places items in robot tote | Walking fatigue, confusion, low pay tied to low throughput | Pick rate, accuracy, retention |
| Shift supervisor | Monitors floor, handles exceptions, reallocates workers | Lack of real-time visibility into picker and robot performance | Throughput per shift, exception resolution time |
| Operations manager | Owns P&L, labor planning, customer SLAs | Labor cost and SLA volatility | Cost per pick, on-time shipment rate |
| IT manager | Integrates AMR software with WMS and customer APIs | Integration complexity, security concerns | Integration uptime, data sync latency |
| Customer success / sales | Sells 3PL services to e-commerce brands | Need credible capacity and flexibility story | New customer win rate, peak surge commitments |

## Goals

1. Increase units picked per labor hour by 40% within 90 days of go-live.
2. Reduce order error rate by 25% within 90 days.
3. Reduce peak-season temp labor dependency by 30%.
4. Achieve 99.5% robot fleet uptime during operating hours.
5. Deploy a working pilot in one zone within 4 weeks, and full warehouse within 12 weeks.

## Non-goals

1. Full lights-out automation. Human pickers remain in the loop.
2. Fixed infrastructure (grids, conveyors, racking overhauls). Deployment must be reversible.
3. Replacing the existing WMS. The AMR layer integrates with it.
4. Autonomous pallet handling or case handling at scale. This is piece/each picking.
5. Predictive analytics for inventory placement beyond simple ABC velocity rules.

## Use cases

### UC1: Standard order pick
- Order wave is released from WMS to AMR fleet manager.
- Fleet manager assigns tasks to available robots based on location, priority, and battery.
- Robot travels to first pick location, displays SKU and quantity on screen.
- Associate picks item, scans barcode, places in tote, confirms on screen.
- Robot proceeds to next pick or to pack-out station.
- WMS is updated with pick confirmation.

### UC2: Batch pick
- Multiple orders are grouped into a single robot tour.
- Robot guides associate through consolidated picks, placing items into separate totes or containers.
- At pack-out, items are sorted by order.

### UC3: Peak surge
- Additional robots are activated during peak periods if available.
- Workforce is augmented with temp pickers who can be trained on the robot interface in under 30 minutes.
- System prioritizes high-SLA orders and de-prioritizes bulk replenishment.

### UC4: Exception handling
- Missing item, wrong SKU, or damaged item at pick location.
- Associate reports exception on robot screen.
- Exception is routed to supervisor tablet for resolution.
- Order can be short-picked, re-routed, or held pending inventory correction.

### UC5: Replenishment
- WMS triggers replenishment tasks for fast-moving SKUs.
- Robot guides associate from receiving/putaway to forward pick locations.
- Confirmations update WMS inventory levels.

## Functional requirements

### FR1: Fleet manager
- Accept order waves from WMS via API or file drop.
- Assign pick tasks to robots using real-time location, battery, and priority.
- Rebalance tasks dynamically when a robot fails or is removed from service.
- Provide estimated completion time per wave.

### FR2: Robot interface
- Display pick instructions (location, SKU image, quantity, confirm button).
- Support barcode scanning for item verification.
- Support exception reporting (missing, wrong, damaged).
- Support multi-language interfaces (English, Bahasa Indonesia, Mandarin, Thai, Vietnamese).

### FR3: Supervisor dashboard
- Real-time view of robot status, battery, location, and task queue.
- Real-time picker performance metrics (picks per hour, accuracy, active time).
- Alerting for robot stuck, battery low, exception backlog, or WMS sync failure.
- Ability to pause/resume a robot or reassign a task.

### FR4: Integration and data sync
- Bidirectional sync with WMS: inventory, orders, pick confirmations, exceptions.
- API or SFTP support for outbound shipment updates.
- Event log for audit and reconciliation.
- Support for inventory snapshot reconciliation at end of shift.

### FR5: Reporting and analytics
- Daily throughput report by zone, shift, and associate.
- Error rate and error type breakdown.
- Robot utilization and downtime reasons.
- Labor cost per pick trend.

## Technical constraints

1. **Network:** Warehouse Wi-Fi must cover all operating zones with <50ms latency to the fleet manager. Redundancy required for peak areas.
2. **WMS:** Existing WMS has limited API surface. Initial integration may require middleware with file-based fallbacks.
3. **Safety:** Collaborative AMRs must comply with local warehouse safety regulations. Emergency stop, light curtains, and speed limits in mixed zones required.
4. **Power:** Charging stations must be placed near break areas and end-of-aisles. Battery swap or autonomous charging must not interrupt peak operations.
5. **Environment:** Floors must be flat and clean. Robot paths must avoid ramps, uneven surfaces, or high-traffic human corridors during peak.
6. **Localization:** SLAM-based navigation must be verified after any significant layout change (e.g., new racking, seasonal build-outs).

## Human-in-the-loop requirements

1. **Override:** Supervisor can stop any robot or take manual control of a task from the dashboard.
2. **Training:** New associates must complete a 30-minute robot training module before working with the fleet.
3. **Fallback:** If the fleet manager is offline, the warehouse can fall back to manual paper/RF picking for a defined zone without losing WMS sync integrity.
4. **Ergonomics:** Robot height, screen angle, and tote placement must meet local ergonomics guidelines.

## Rollout phases

### Phase 0: Pilot design (Week 1)
- Select one zone (20-30 robots) with high-volume, stable SKU profile.
- Map Wi-Fi, charging locations, and pick paths.
- Define WMS integration scope and data mappings.
- Train pilot team.

### Phase 1: Pilot go-live (Weeks 2-4)
- Deploy robots in pilot zone.
- Run parallel manual picking for comparison.
- Tune task allocation, pick sequencing, and charging schedules.
- Validate accuracy and throughput targets.

### Phase 2: Expansion (Weeks 5-10)
- Add zones and robots incrementally.
- Train additional supervisors and associates.
- Integrate exception handling and replenishment workflows.
- Refine WMS integration based on pilot learnings.

### Phase 3: Optimization (Weeks 11-12)
- Remove parallel manual fallback.
- Enable analytics-driven slotting recommendations.
- Lock down standard operating procedures (SOPs) and support runbooks.
- Document ROI and lessons learned.

## Success metrics and acceptance criteria

| Metric | Baseline | 30-day target | 90-day target |
|---|---|---|---|
| Units picked per labor hour | X | X + 20% | X + 40% |
| Order error rate | Y | Y - 15% | Y - 25% |
| Robot fleet uptime | - | 99.0% | 99.5% |
| Peak temp labor hours | Z | Z - 15% | Z - 30% |
| WMS sync latency | - | <5 min | <2 min |
| Associate training time | 2 days | 1 day | <30 min |
| Supervisor exception resolution time | - | <10 min | <5 min |

## Open questions

1. Should the initial integration be API-first or file-based, given WMS constraints?
2. Which zone should be the pilot? High-volume stable SKUs or high-walking-distance SKUs?
3. How many robots are needed for full warehouse coverage? Estimate based on pick density and robot capacity.
4. What is the vendor's local support presence in Southeast Asia?
5. What are the exit terms if the pilot does not meet targets after 90 days?

## Assumptions

1. WMS can export order waves and inventory data in a structured format.
2. Warehouse floor is suitable for AMR navigation with minimal modification.
3. Local labor regulations allow collaborative robot-human workflows.
4. Customer order profiles are predictable enough to allow wave-based picking.
5. Vendor provides training, remote support, and spare parts logistics for the region.

## Reference

This PRD is intentionally designed as a contrast to the Symbotic full-stack RDC model in `case-study-walmart-symbotic.md`. It represents a lower-capital, faster-deployment, human-in-the-loop automation path suitable for mid-market 3PLs.
