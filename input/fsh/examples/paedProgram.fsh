
Alias: $vaccCode = http://clinfhir.com/CodeSystem/vaccCodes

CodeSystem: VaccCodes
Id: vaccCodes
Title: "Made up Vaccination codes"
Description: "Codesystem for vaccination codes"

* ^url = "http://clinfhir.com/CodeSystem/vaccCodes"

* #dtap "DTaP-IPV-HepB/Hib"
* #pcv10 "PCV10"
* #rv1 "RV1"


// ======================== Activity Definitions
//One for each vaccine

Instance: adDtap
InstanceOf: ActivityDefinition
Description: "Administer DTap vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/dtap"
* title = "Administer DTap vaccine"
* status = #draft
* productCodeableConcept = $vaccCode#dtap "DTaP-IPV-HepB/Hib"

Instance: adPcv10
InstanceOf: ActivityDefinition
Description: "Administer PCV10 vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/pcv10"
* title = "Administer PCV10 vaccine"
* status = #draft
* productCodeableConcept = $vaccCode#pcv10 "PCV10"

Instance: adRv1
InstanceOf: ActivityDefinition
Description: "Administer RV1 vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/rv1"
* title = "Administer RV1 vaccine"
* status = #draft
* productCodeableConcept = $vaccCode#prv1 "RV1"

//===================== Paed plan definition

Instance: pd1
InstanceOf: PlanDefinition
Description: "Paediatric plan definition"
Usage: #example

* status = #draft
* description = "The New Zealand Paediatric Immunization program"

* goal.description.text = "Ensure child is immunized from childhood illnesses"
* relatedArtifact.type = #derived-from
* relatedArtifact.url = "https://www.health.govt.nz/our-work/immunisation-handbook-2020/national-immunisation-schedule"

* action[0].title = "DTap administration at 6 weeks"
* action[0].timingAge = 6 'wk'
* action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/dtap"

//don't administer if allergic to egg white
* action[0].condition[0].kind = #applicability
* action[0].condition[0].expression.description = "Not allergic to egg white"
* action[0].condition[0].expression.language = #text/cql

* action[1].title = "PCV10 administration at 6 weeks"
* action[1].timingAge = 6 'wk'
* action[1].definitionCanonical = "http://clinfhir/ActivityDefinition/pcv10"

* action[2].title = "RV1 administration at 6 weeks"
* action[2].timingAge = 6 'wk'
* action[2].definitionCanonical = "http://clinfhir/ActivityDefinition/rv1"

* action[3].title = "DTap administration at 3 months"
* action[3].timingAge = 3 'mo'
* action[3].definitionCanonical = "http://clinfhir/ActivityDefinition/dtap"

//don't administer if allergic to egg white
* action[3].condition[0].kind = #applicability
* action[3].condition[0].expression.description = "Not allergic to egg white"
* action[3].condition[0].expression.language = #text/cql


* action[4].title = "RV1 administration at 3 months"
* action[4].timingAge = 3 'mo'
* action[4].definitionCanonical = "http://clinfhir/ActivityDefinition/rv1"