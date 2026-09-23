# WCTO Common Workflow

## Overview

This page describes the high-level workflow for digital Well Child Tamariki Ora (WCTO) services.

The B4 School Check (B4SC) is the initial use case.

The workflow separates:

- the reusable definition of a WCTO health service;
- identification of the eligible child cohort;
- creation of a child-specific scheduled health event;
- individual activities required to complete that event;
- structured assessments;
- assignment and responsibility;
- participation and consent;
- status tracking.

Not every future WCTO contact is expected to use every activity or assessment described in the B4SC example.

---

## High-Level Workflow

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
Participation / Consent
Consent
        ↓
Required Activities
Task
        ↓
Structured Assessment
Questionnaire
        ↓
QuestionnaireResponse
        ↓
Task status updated
        ↓
Overall CarePlan status updated