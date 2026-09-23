# WCTO Actors and Systems

## Overview

This page identifies the people, organisations, provider systems and national digital services that may participate in Well Child Tamariki Ora (WCTO) digital workflows.

The B4 School Check (B4SC) is the initial use case.

Not every actor or system will participate in every WCTO contact.

---

## Child

The child receiving the WCTO service.

Potential FHIR representation:

- `Patient`

The child is the subject of the scheduled health event, assessment information and related WCTO activity.

---

## Parent, Caregiver or Whānau

A parent, caregiver, guardian or other whānau member may participate in the WCTO service.

Depending on the use case, they may:

- provide information about the child;
- participate in assessments;
- provide consent;
- receive information about outcomes;
- support the child through the WCTO activity.

Potential FHIR representation may include:

- `RelatedPerson`
- `Consent`
- Questionnaire / QuestionnaireResponse information where appropriate

The detailed representation will depend on the requirements of the individual WCTO contact.

---

## Clinician

A healthcare professional may complete one or more WCTO activities.

Depending on the service, the clinician may:

- complete an assessment;
- complete a FHIR Questionnaire;
- review QuestionnaireResponse information;
- record clinical information;
- update Task status;
- participate in the child's CareTeam.

Potential FHIR representation:

- `Practitioner`
- `PractitionerRole`

---

## Provider Organisation

The organisation responsible for delivering some or all of the WCTO service.

Potential FHIR representation:

- `Organization`

Provider organisations may deliver different components of the same WCTO health event.

For example, one provider may complete a nursing assessment while another service completes vision and hearing activities.

---

## Overall Service Responsibility

Responsibility for the overall scheduled health event may be represented using `CareTeam`.

Conceptually:

```text
CarePlan
   ↓
CareTeam
   ↓
Overall WCTO provider responsibility