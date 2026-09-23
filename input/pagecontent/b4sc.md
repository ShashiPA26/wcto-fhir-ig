# B4 School Check

## Overview

The B4 School Check (B4SC) is the initial Well Child Tamariki Ora (WCTO) use case supported by this Implementation Guide.

B4SC is the final universal WCTO contact and is generally delivered around the age of four.

The B4SC use case applies the common WCTO FHIR model to:

- identify children who are due for B4SC;
- create a child-specific scheduled health event;
- identify the activities required to complete the B4SC;
- assign responsibility for those activities;
- capture structured assessments;
- track completion of individual activities;
- determine overall B4SC completion status.

---

## B4SC Service Model

The current working model is:

```text
B4 School Check Service
PlanDefinition
        ↓
Eligible B4SC Cohort
Group
        ↓
Child-specific B4SC Event
CarePlan
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
Overall B4SC CarePlan status updated
