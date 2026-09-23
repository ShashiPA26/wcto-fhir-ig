# WCTO Use Cases

## Overview

This page describes the initial business use cases supported by the Well Child Tamariki Ora (WCTO) Implementation Guide.

The B4 School Check (B4SC) is the initial WCTO use case.

The use cases focus on the current in-scope capabilities:

- cohort and eligibility;
- creation of a child-specific health event;
- activity tracking;
- assignment;
- consent;
- structured assessments;
- status tracking;
- overall completion.

Appointment and booking workflows and referral workflow management are outside the current scope.

---

## Use Case 1 — Child Becomes Due for B4SC

### Purpose

Identify children who are approaching or reaching B4SC eligibility.

### Trigger

A child approaches the age at which B4SC becomes due.

### Actors and Systems

- Child
- NHI
- WCTO cohort capability
- Health NZ coordinator capability

### Potential FHIR Resources

- `Patient`
- `Group`

### High-Level Flow

```text
Child population
      ↓
Eligibility rules applied
      ↓
Child becomes due for B4SC
      ↓
Child added to eligible cohort
Group