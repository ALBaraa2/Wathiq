# JurisProp

**المنصّة العقارية القانونية الذكية**
*A smart PropTech × LegalTech × AI platform*

JurisProp closes the entire real-estate loop in a single connected digital journey — from property search, through AI-generated contracts, lawyer review and approval, digital signature, to payment and portfolio management.

---

## Overview

JurisProp is a **multi-tenant hybrid SaaS platform** that connects every party in a real-estate transaction — owner, tenant/buyer, broker, licensed lawyer, and platform admin — in one digital experience. It combines machine speed with human legal precision across three integrated layers:

| Layer | Technology | Responsibility |
|---|---|---|
| **Companies & Lawyers Dashboard** | Laravel (SaaS Backend & Web Admin) | Complex data management, fine-grained permissions, full multi-tenant data isolation |
| **Mobile Apps** | Flutter | Fast, interactive interfaces for brokers and tenants on the go |
| **AI Microservice** | RAG (Retrieval-Augmented Generation) | Independent service that generates contracts strictly grounded in local legal texts |

### In scope
- Real-estate listing search & display
- AI contract generation
- Legal review & approval
- Digital signature
- Property management & smart alerts
- Digital wallet & payments

### Out of scope (Phase 1)
- Direct in-app rent/insurance payment to the owner (planned as a future step)
- Integration with official government notarization bodies

---

## Core Features

1. **Property Listing & Search** — advanced listing and filtering for apartments, shops, warehouses, and courts/fields, with full media/detail management.
2. **Automated Contract Generation** — instant, bilingual (Arabic/English) AI-generated contracts, grounded exclusively in an ingested local-law database (no outside authoring).
3. **Legal Review & Approval** — contracts are auto-routed to a licensed lawyer, with only variable/critical clauses highlighted to speed up review (approval in minutes, not days).
4. **Digital Signature & Notarization** — certified remote e-signature for all parties, encrypted tamper-evident cloud archiving, and a unique cryptographic fingerprint per contract (any later edit breaks the signature).
5. **Property & Smart Alerts Management** — a single dashboard to track hundreds of properties, automatic alerts for rent due dates and contract renewals, and OCR-based ingestion of legacy paper contracts to flag non-compliant clauses and suggest new ones.
6. **Digital Wallet & Payments** — internal wallet per lawyer/owner, pending vs. available balance, automatic/manual withdrawal requests, automatic commission splitting, and an escrow account that holds funds until signature and handover are complete. Supports recurring SaaS subscriptions and pay-per-contract billing.

---

## User Roles

| Role | Description & Core Permissions |
|---|---|
| **Owner / Real-estate Office** | List and manage properties, track contracts and payments, receive alerts, withdraw earnings from wallet |
| **Tenant / Buyer** | Search properties, request contracts, review, digitally sign, track payments |
| **Real-estate Broker** | Manage properties and clients, complete field tasks via mobile app |
| **Licensed Lawyer** | Review and approve contracts, manage wallet, withdraw commissions |
| **Platform Admin** | Manage tenants, permissions, transfer scheduling, system monitoring |

---

## Functional Requirements Summary

| Module | Highlights | Priority |
|---|---|---|
| **FR-1** Property listing & search | Multi-type listings, media management, advanced filtering | High |
| **FR-2** Automated contract generation | AI generation, local-law-only grounding, bilingual output | High |
| **FR-3** Legal review & approval | Auto-routing to lawyer, critical-clause highlighting, fast approval | High |
| **FR-4** Digital signature & notarization | Remote e-signature, encrypted archive, unique fingerprint | High |
| **FR-5** Property management & alerts | Dashboard, auto alerts, OCR on legacy contracts | High / Medium |
| **FR-6** Digital wallet & payments | Wallet, pending/available balance, escrow, SaaS + pay-per-contract billing | High / Medium |

---

## Non-Functional Requirements

| ID | Category | Requirement |
|---|---|---|
| NFR-1 | Security | Encryption of contract & payment data; tamper-proof digital fingerprint per signed contract |
| NFR-2 | Privacy & Isolation | Full data isolation per tenant (company) under the multi-tenant architecture |
| NFR-3 | Scalability | Horizontally scalable architecture supporting hundreds of properties/companies without performance loss |
| NFR-4 | Performance | Instant contract generation; legal approval within minutes |
| NFR-5 | Availability | Reliable cloud archiving ensuring continuous access to contracts |
| NFR-6 | Usability | Fast, interactive mobile and web interfaces for all user types |
| NFR-7 | Legal Compliance | Adherence to local real-estate law in contract generation and approval |
| NFR-8 | Maintainability | AI engine decoupled as an independent service, updatable without affecting the rest of the system |

---

## Business Model & Revenue

| Source | Description |
|---|---|
| **Monthly SaaS subscriptions** | Tiered plans (basic / advanced / business) based on staff count and managed property volume |
| **Legal notarization commission** | Flat fee per contract review; platform retains 20%, 80% goes to the reviewing lawyer |
| **Pay-per-contract** | One-time payment option for individuals and small offices who prefer not to subscribe |

**Future step:** direct in-app rent and insurance payment to the owner.

---

## Go-to-Market Strategy

Targets the **B2B** segment through four pillars:

1. **Beta launch** — 3 months free for 10 real-estate offices and 5 lawyers to build documented success stories.
2. **Content marketing** — simplified technical/legal articles targeting real-estate advice seekers.
3. **Explainer video content** — short motion-graphic videos explaining the value proposition in 3 steps.
4. **Trusted visual identity** — a logo and UI reflecting professionalism, security, and technical maturity.

---

## End-to-End Digital Journey

The system closes the real-estate loop across five connected stages:

1. **Find the property** — smart search & filtering
2. **Draft the contract** — instant AI generation
3. **Legal approval** — licensed lawyer review
4. **Digital signature** — secure, encrypted notarization
5. **Manage & follow up** — alerts and automatic renewal

---

## Glossary

| Term | Definition |
|---|---|
| **SRS** | Software Requirements Specification document |
| **RAG** | Retrieval-Augmented Generation; contract generation grounded exclusively in ingested local law texts |
| **OCR** | Optical Character Recognition, used to read legacy paper contracts |
| **Escrow** | A secure intermediary account that holds funds until signature and handover conditions are met |
| **Multi-Tenant** | Architecture that fully isolates each real-estate company's data within a single system |
| **SaaS** | Software as a Service, delivered via recurring subscription |
| **B2B** | Business-to-business model targeting companies and real-estate offices |

---

## Assumptions & Constraints

- Contract generation relies exclusively on ingested local legal texts — no content is authored outside that source.
- The multi-tenant architecture enforces full data isolation per company.
- Signature and payment services require internet connectivity and a certified payment gateway.
- An up-to-date, accurate legal database is assumed as the generation engine's reference.
