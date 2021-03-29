
Alias: SCT = http:snomed.info

CodeSystem: VaccCodes
Id: vaccCodes
Title: "Made up Vaccination codes"
Description: "Codesystem for vaccination codes to assist with design work. Will be replaced with SNOMED codes eventually."

* ^url = "http://clinfhir.com/CodeSystem/vaccCodes"

* #dtap "DTaP-IPV-HepB/Hib"
* #pcv10 "PCV10"
* #rv1 "RV1"
* #mmr "MMR"
* #hib "Hib"
* #vv "VV"

ValueSet: DiseaseCovered
Id: disease-diseaseCovered
Title: "Diseases that are covered by the immunization programme"

* SCT#397428000 "Diptheria"
* SCT#76902006 "Tetanus"
* SCT#27836007 "Pertussis"
* SCT#398102009 "Polio Myelitis"
* SCT#66071002 "Viral Hepatitis type B"
* SCT#91428005 "Haemophilus Influenzae infection"