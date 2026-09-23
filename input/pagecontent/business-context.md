# Business Context

## Overview

Well Child Tamariki Ora (WCTO) supports a range of child health activities delivered across different healthcare settings, workforces and provider organisations.

The future digital approach is intended to allow healthcare providers to continue working within their existing Practice Management System (PMS) or Electronic Medical Record (EMR), while interacting with national digital services using APIs and structured FHIR artefacts.

The purpose of this Implementation Guide is to define a common FHIR-based integration pattern that can support WCTO services consistently across provider systems.

The B4 School Check (B4SC) is the initial use case for this Implementation Guide.

Future WCTO contacts may reuse the same common model where appropriate.

---

## Initial Use Case — B4 School Check

The B4 School Check is the final universal WCTO contact and is usually completed around age four.

The B4SC may include:

- whānau information;
- Early Childhood Education information;
- nursing assessment;
- vision and hearing screening;
- immunisation information;
- follow-up activities;
- national service and outcome reporting.

Different B4SC components may be completed by different workforces or organisations.

The future solution therefore needs to support:

- identification of children who are due for B4SC;
- creation of an individual scheduled health event;
- visibility of outstanding and completed B4SC activities;
- structured clinical assessments;
- assignment of activities to appropriate providers or workforces;
- consent and participation requirements;
- overall B4SC status tracking;
- information sharing across authorised care settings.

The vendor briefing specifically notes that B4SC components may be completed by different workforces and organisations, and that the future solution must support integrated provider workflows and visibility of overall check status. :contentReference[oaicite:0]{index=0}

---

## Common WCTO Service Model

The current working model separates the reusable definition of a WCTO service from the individual event created for a child.

Conceptually:

```text
Health Service Definition
PlanDefinition
        ↓
Eligible Child Cohort
Group
        ↓
Scheduled Health Event
CarePlan
        ↓
Required / Outstanding Activities
Task
        ↓
Assessment
Questionnaire
        ↓
QuestionnaireResponse
        ↓
Task completion
        ↓
Overall CarePlan / health event status updated