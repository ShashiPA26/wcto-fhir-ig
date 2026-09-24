# wcto-fhir-ig

FHIR Implementation Guide for Well Child Tamariki Ora services.

## Build locally

The repository uses SUSHI and the HL7 FHIR IG Publisher. The helper scripts keep the publisher outside source control and support Linux/macOS and Windows.

Use Git Bash, WSL, or another Unix-like shell to run the scripts. If the shell scripts are not executable on a fresh checkout, run:

```bash
git update-index --chmod=+x _build.sh _genonce.sh _gencontinuous.sh _updatePublisher.sh
```

Then run:

```bash
./_build.sh update   # download the latest publisher
./_build.sh build    # run SUSHI and publish the IG
./_build.sh watch    # continuously rebuild while editing
./_build.sh clean