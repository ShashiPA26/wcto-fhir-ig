# WCTO Business Rules

## Overview

This page records the current working business rules for Well Child Tamariki Ora (WCTO) digital workflows.

The B4 School Check (B4SC) is the initial use case.

These rules will be refined as programme, clinical and technical requirements are confirmed.

## Eligibility

For B4SC, the current working rules indicate that:

- eligibility is based primarily on the child approaching or turning four years old;
- children are included regardless of citizenship or health eligibility status;
- cohort generation may need to occur approximately two to three months before the child's fourth birthday to support service preparation.

The detailed eligibility mechanism remains to be confirmed.

## Cohort Generation

An eligible child cohort may be represented using FHIR `Group`.

The following details remain to be confirmed:

- who generates the cohort;
- who owns and maintains the cohort;
- how often the cohort is refreshed;
- how demographic changes affect cohort membership;
- how children are removed from the cohort;
- whether Group is the final FHIR representation.

## Health Service Definition

A WCTO health service may be defined using `PlanDefinition`.

The PlanDefinition may define:

- required activities;
- optional activities;
- sequencing requirements;
- expected assessment types;
- completion rules.

For B4SC, the current working activities include:

- Consent;
- Nursing Assessment;
- Whānau Assessment;
- Early Childhood Education Assessment;
- Vision and Hearing.

## Scheduled Health Event

A child-specific WCTO event may be represented using `CarePlan`.

The CarePlan may provide the context for:

- the child;
- the WCTO service;
- required activities;
- activity status;
- assigned providers;
- overall event status.

The rules for creating and completing the CarePlan remain to be confirmed.

## Consent

Consent should be completed before the remaining B4SC assessment activities.

If consent is not provided, the downstream assessment workflow should not proceed unless a confirmed business rule states otherwise.

The representation of consent may include:

- FHIR `Consent`;
- structured Questionnaire information;
- programme participation status.

The final approach remains to be confirmed.

## Assessment Ordering

After consent is completed, the remaining B4SC assessments should generally be able to occur in any order.

These may include:

- Nursing Assessment;
- Vision and Hearing;
- Whānau Assessment;
- Early Childhood Education Assessment.

The Implementation Guide should not enforce additional sequencing unless there is a confirmed clinical or business requirement.

## Activity Tracking

Required and outstanding WCTO activities may be represented using `Task`.

Each Task may have its own:

- status;
- owner;
- associated assessment;
- completion information.

The Task lifecycle and allowed status values remain to be confirmed.

## Assignment

Assignment may exist at more than one level.

Potential representation includes:

- `CareTeam` for overall responsibility for the health event;
- `Task.owner` for responsibility for an individual activity.

The relationship between provider nomination, CareTeam and Task ownership remains to be confirmed.

## Assessment Completion

An assessment may be considered completed when the relevant `QuestionnaireResponse` meets the programme-specific completion requirements.

The detailed completion rules for each assessment remain to be defined.

These may include:

- all mandatory questions answered;
- required clinical review completed;
- QuestionnaireResponse status set appropriately;
- related Task marked complete.

## Overall Event Completion

The overall WCTO health event may be considered complete when all mandatory activities have satisfied their completion requirements.

The final rules for calculating overall CarePlan completion remain to be confirmed.

Considerations may include:

- all mandatory Tasks completed;
- required consent obtained;
- required assessments completed;
- optional activities not blocking overall completion;
- declined or unable-to-complete activities handled appropriately.

## Status Tracking

Status may exist at multiple levels.

| Business Level | Potential FHIR Representation |
|---|---|
| Overall health event | `CarePlan.status` |
| Individual activity | `Task.status` |
| Assessment | `QuestionnaireResponse.status` |
| Participation | `Consent.status` |

The relationship between these statuses and the business-level WCTO status remains to be confirmed.

## Out of Scope

The following are outside the current scope of the Implementation Guide:

- appointment and booking management;
- referral workflow management.

These activities may continue to be managed within provider systems or other services.

## Open Questions

The following rules still require confirmation:

- Who determines eligibility?
- Who creates and maintains the eligible cohort?
- When is a CarePlan created?
- What causes a CarePlan to become active?
- Which Tasks are mandatory?
- What Task statuses are required?
- What happens when consent is declined?
- What happens when an assessment cannot be completed?
- What constitutes a completed QuestionnaireResponse?
- How is overall event completion calculated?
- How are partially completed WCTO events represented?
- How are provider assignment changes handled?