# API Development Guide

## Overview

This page provides implementation guidance for software vendors and developers integrating with Well Child Tamariki Ora (WCTO) digital services.

The B4 School Check (B4SC) is the initial use case.

This guide will evolve as the detailed WCTO API architecture, security model and supported FHIR interactions are confirmed.

---

## API Scope

The WCTO digital integration model is expected to support:

- identification of eligible children;
- access to scheduled WCTO health events;
- access to outstanding activities;
- structured FHIR assessments;
- submission of completed QuestionnaireResponses;
- activity status updates;
- provider and activity assignment;
- consent and participation information;
- overall WCTO status visibility.

Appointment and booking management and referral workflow management are outside the current scope.

---

## FHIR Version

The WCTO Implementation Guide currently uses:

```text
FHIR R4
Version 4.0.1