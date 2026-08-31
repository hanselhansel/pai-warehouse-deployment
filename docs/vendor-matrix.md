# Warehouse Automation Vendor Matrix

A comparison of five leading warehouse automation vendors, focused on deployment models, integration surfaces, and operational fit for warehouse/logistics Physical AI.

## Snapshot

| Vendor | Category | Form Factor | Target Customer | Deployment Model | Pricing Signal | Integration Surface | Key Strength | Key Risk |
|---|---|---|---|---|---|---|---|---|
| Symbotic | Full-stack warehouse automation | SymBot AMRs + robotic arms + fixed storage structure | Large retail / grocery / CPG regional DCs | Enterprise contract, 15-year system sale + recurring software/services | Custom B2B; no list price; $22.5B backlog | WMS integration, proprietary AI orchestration platform | End-to-end case handling at scale; strong Walmart anchor | Customer concentration; long implementation; high capital commitment |
| AutoStore | Cube storage / goods-to-person | Cube grid + robots on rails + ports | E-commerce, 3PL, fashion, electronics, pharma | Direct sale + partner network; RaaS options emerging | System-level; partner/distributor pricing (e.g., THG Fulfil) | APIs to WMS, OMS, and partner fulfillment software | Dense storage, 99.8% uptime, brownfield-friendly, modular expansion | Fixed grid structure limits reconfigurability; goods-to-person labor still required |
| Locus Robotics | Collaborative AMR | Locus Origin / Vector / Array robots | E-commerce, retail, 3PL, healthcare | Robot-as-a-Service (RaaS), cloud-based fleet management | ~$1,500/robot/month (reported); service contract | LocusOne platform; REST/cloud APIs; WMS integration | Fast deployment, proven at scale (3B+ picks), multi-vendor orchestration direction | Relies on human pickers; productivity depends on WMS data quality |
| 6 River Systems | Collaborative AMR/cart | Chuck cart-based AMR | Mid-market e-commerce, retail, 3PL | Lease/service model; part of Ocado | Lease terms; bundled fleet + software | Chuck OS; cloud platform; WMS connectors | Easy path-level optimization; strong Shopify/Ocado retail DNA | Smaller fleet scale vs Locus; less enterprise presence |
| Exotec | 3D mobile goods-to-person | Skypod robots climbing racks + ports | E-commerce, retail, industrial, 3PL | System sale + service | System-level; competitive to AutoStore | Skypod software; WMS/OMS APIs | Handles both piece picks and full cases in same system; flexible rack layout | Newer installed base than AutoStore; scaling enterprise proof ongoing |

## Detailed profiles

### Symbotic

- **Product:** Integrated warehouse automation system combining high-speed SymBot AMRs, vision-guided robotic arms, and a fixed storage structure, orchestrated by AI software.
- **Go-to-market:** Direct enterprise sales; 15-year contracts with milestone payments; recurring software and maintenance revenue.
- **Customers:** Walmart (anchor, ~85% of recent revenue), Albertsons, C&S Wholesale, Target, GreenBox JV (SoftBank).
- **Deployment model:** Large, multi-year DC retrofits or greenfield builds. Systems are modular but require significant capital and project management.
- **Integration surface:** Proprietary AI orchestration platform; WMS integration; APIs not publicly documented in detail.
- **Failure modes to watch:** Customer concentration risk; long install timelines; dependency on accurate master data and SKU profiles; operational disruption during brownfield cutover.
- **Good fit when:** You are a large retailer/CPG with predictable high-volume case handling and capital for a 15-year automation program.
- **Bad fit when:** You need flexible, incremental automation; small/mid-market footprint; or rapid reconfiguration.

### AutoStore

- **Product:** Cube-based goods-to-person storage and retrieval system. Robots run on top of an aluminum grid, retrieving bins and delivering them to operator ports.
- **Go-to-market:** Direct sales + global partner network (e.g., THG Fulfil, Swisslog, Dematic). Recently signed strategic supply agreement with Amazon.
- **Customers:** ~1,350 customers, ~2,000 sites across 60 countries. Strong in e-commerce, fashion, electronics, pharma, 3PL.
- **Deployment model:** Modular; can be installed in existing buildings with phased expansion. Brownfield deployments common.
- **Integration surface:** WMS/OMS integration via partner middleware and native APIs. Ports are human-facing workstations.
- **Failure modes to watch:** Grid is fixed infrastructure; SKU growth can hit grid density limits; workstation ergonomics and labor remain critical; partner quality varies.
- **Good fit when:** You need high storage density, high uptime, and a proven, modular system in e-commerce/3PL.
- **Bad fit when:** You need handling of very large/bulky items; frequent layout changes; or fully automated picking without human operators.

### Locus Robotics

- **Product:** Collaborative AMRs that guide human pickers in person-to-goods workflows. LocusOne platform manages task allocation, fleet routing, and analytics.
- **Go-to-market:** Robot-as-a-Service (RaaS); cloud-based fleet management.
- **Customers:** 300+ sites, DHL, many retailers and 3PLs. Crossed 3B+ picks and ~$2B valuation.
- **Deployment model:** Fast deployment (weeks); low infrastructure change; can start with a small fleet and expand.
- **Integration surface:** LocusOne cloud platform; REST APIs; WMS connectors; dashboards and analytics.
- **Failure modes to watch:** Pick rate depends on clean WMS data and slotting; congestion during peak; human picker training and adherence; RaaS lock-in.
- **Good fit when:** You want fast, incremental piece-picking automation without heavy infrastructure.
- **Bad fit when:** You need end-to-end case handling; heavy payloads; or full lights-out automation.

### 6 River Systems (6RS)

- **Product:** Chuck, a collaborative cart-based AMR that carries totes/cartons and directs workers via touchscreen.
- **Go-to-market:** Lease/service model; acquired by Shopify, then integrated into Ocado Group.
- **Customers:** Mid-market e-commerce, retail, and 3PL operations.
- **Deployment model:** Similar to Locus: cart-based, fast to deploy, low infrastructure.
- **Integration surface:** Chuck OS; cloud platform; WMS connectors.
- **Failure modes to watch:** Smaller maximum fleet size than Locus; less enterprise proven; path-level optimization may struggle with dynamic congestion.
- **Good fit when:** Mid-market operations that value Shopify/Ocado ecosystem alignment and cart-based workflows.
- **Bad fit when:** Large-scale multi-robot fleets or heavy payloads.

### Exotec

- **Product:** Skypod 3D mobile robots that climb storage racks and deliver bins to ports. Handles both piece picks and full cases in the same system.
- **Go-to-market:** System sale + service; positioned as a flexible alternative to AutoStore.
- **Customers:** Oxford Industries, Grainger, E.Leclerc, and 20+ recent wins totaling $400M+.
- **Deployment model:** Modular rack layout; can be phased and expanded; robots and racks are more decoupled than AutoStore's fixed grid.
- **Integration surface:** Skypod software; WMS/OMS APIs.
- **Failure modes to watch:** Smaller installed base than AutoStore; enterprise scaling still being proven; rack configuration complexity.
- **Good fit when:** You want goods-to-person density with more layout flexibility and mixed piece/case handling.
- **Bad fit when:** You want the most mature, proven cube-storage vendor with the largest partner ecosystem.

## Synthesis

| Use case | Likely best fit |
|---|---|
| Large retailer/CPG case handling, 15-year automation program | Symbotic |
| Dense e-commerce/3PL storage, brownfield, proven uptime | AutoStore |
| Fast incremental piece-picking automation, low infrastructure | Locus Robotics |
| Shopify/Ocado ecosystem, mid-market cart-based picking | 6 River Systems |
| Flexible goods-to-person with mixed piece/case handling | Exotec |

## Open questions for deeper analysis

1. What are the real WMS integration requirements and timelines for each vendor?
2. How do each vendor's uptime and support SLAs compare in multi-shift operations?
3. What is the actual total cost of ownership (TCO) over 5-7 years for a 50-robot Locus deployment vs. an AutoStore grid of similar throughput?
4. How do these vendors handle returns, reverse logistics, and seasonal peak scaling?
5. Which vendors have active Southeast Asia presence or partners?

## Sources

- Symbotic Q3 2026 earnings call and investor presentation (2026-08-12).
- AutoStore Q2 2026 financial results and investor presentation (2026-08-13).
- Robotomated Locus vs 6 River comparison (2026).
- Supply Chain Research warehouse robotics buyers guide (2026).
- Murat's Lab field notes on AMR vendors (2026).
- AutoStore brownfield retrofit case studies and THG Fulfil partnership materials (2026).
- Exotec Skypod product announcements and customer wins (2026).
