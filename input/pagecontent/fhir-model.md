# WCTO FHIR Information Model

## Overview

This page describes the initial FHIR information model for digital Well Child Tamariki Ora (WCTO) services.

The model is intended to support the B4 School Check (B4SC) as the initial use case while allowing common WCTO patterns to be reused by future WCTO contacts.

The mappings below are preliminary and will be refined as the detailed cohort, scheduling, assessment, assignment, consent and status requirements are confirmed.

Existing New Zealand and Health New Zealand FHIR artefacts should be reused where appropriate before introducing WCTO-specific profiles, extensions or terminology.

## High-Level Model

```text
Health Service
PlanDefinition
      ↓
Eligible Cohort
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
Task completed
      ↓
CarePlan / overall event status updated