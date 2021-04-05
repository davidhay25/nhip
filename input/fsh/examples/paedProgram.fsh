
Alias: $vaccCode = http://clinfhir.com/CodeSystem/vaccCodes
Alias: $forecastStatus = http://terminology.hl7.org/CodeSystem/immunization-recommendation-status
//Alias: $vaccSeq = http://clinfhir.com/StructureDefinition/vacc-sequence

// ======================== Activity Definitions
//One for each vaccine

Instance: adDtap
InstanceOf: ActivityDefinition
Description: "Administer DTap vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/dtap"
* title = "Administer DTap vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#397428000 "Diptheria"
* extension[disease-covered][1].valueCodeableConcept = SCT#76902006 "Tetanus"
* extension[disease-covered][2].valueCodeableConcept = SCT#27836007 "Pertussis"
* extension[disease-covered][3].valueCodeableConcept = SCT#398102009 "Polio Myelitis"
* extension[disease-covered][4].valueCodeableConcept = SCT#66071002 "Viral Hepatitis type B"
* extension[disease-covered][5].valueCodeableConcept = SCT#91428005 "Haemophilus Influenzae"


//This is a made up code! Probably SNOMED for real
* productCodeableConcept = $vaccCode#dtap "DTaP-IPV-HepB/Hib"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"


Instance: adPcv10
InstanceOf: ActivityDefinition
Description: "Administer PCV10 vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/pcv10"
* title = "Administer PCV10 vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#16814004 "Pneumococcal disease"

* productCodeableConcept = $vaccCode#pcv10 "PCV10"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"


Instance: adRv1
InstanceOf: ActivityDefinition
Description: "Administer RV1 vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/rv1"
* title = "Administer RV1 vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#18624000 "Rotavirus"

* productCodeableConcept = $vaccCode#prv1 "RV1"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"

//----
Instance: adDmmr
InstanceOf: ActivityDefinition
Description: "Administer MMR vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/mmr"
* title = "Administer MMR vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#14189004 "Measles"
* extension[disease-covered][1].valueCodeableConcept = SCT#36989005 "Mumps"
* extension[disease-covered][2].valueCodeableConcept = SCT#36653000 "Rubella"

* productCodeableConcept = $vaccCode#mmr "MMR"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"

Instance: adDhib
InstanceOf: ActivityDefinition
Description: "Administer Hib vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/hib"
* title = "Administer Hib vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#91428005 "Haemophilus influenzae "


* productCodeableConcept = $vaccCode#hib "Hib"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"

Instance: adVV
InstanceOf: ActivityDefinition
Description: "Administer VV vaccine"
Usage: #example

* url = "http://clinfhir/ActivityDefinition/vv"
* title = "Administer VV vaccine"
* status = #draft

* extension[disease-covered][0].valueCodeableConcept = SCT#38907003 "Varicella"



* productCodeableConcept = $vaccCode#vv "VV"
* dosage.doseAndRate.doseQuantity = 0.5 'ml'
* dosage.route = http://snomed.info/sct#78421000 "Intramuscular route"



//===================== Paed plan definition

Instance: pd2
InstanceOf: PlanDefinition
Description: "Paediatric plan definition for children 15 months and younger"
Usage: #example

* status = #draft
* description = "The New Zealand Paediatric Immunization program"
* url = "http://clinfhir.com/PlanDefinition/paediatric"

* goal.description.text = "Ensure child is immunized from childhood illnesses"
* relatedArtifact.type = #derived-from
* relatedArtifact.url = "https://www.health.govt.nz/our-work/immunisation-handbook-2020/national-immunisation-schedule"

//================

//--------- 6 weeks immunization
* action[0].title = "6 week vaccinations"
* action[0].timingAge = 6 'wk'
* action[0].groupingBehavior = #logical-group
* action[0].selectionBehavior = #all 
* action[0].requiredBehavior = #must-unless-documented
* action[0].cardinalityBehavior = #single

// --- 6 week vaccines
* action[0].action[0].title = "DTap administration at 6 weeks"
* action[0].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/dtap"
* action[0].action[0].extension[vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[0].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[0].action[1].title = "PCV10 administration at 6 weeks"
* action[0].action[1].definitionCanonical = "http://clinfhir/ActivityDefinition/pcv10"
* action[0].action[1].extension[vacc-sequence].extension[series].valueString = "PCV10"
* action[0].action[1].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[0].action[2].title = "RV1 administration at 6 weeks"
* action[0].action[2].definitionCanonical = "http://clinfhir/ActivityDefinition/rv1"
* action[0].action[2].extension[vacc-sequence].extension[series].valueString = "RV1"
* action[0].action[2].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

// -------- 3 months immunization
* action[1].title = "3 month vaccinations"
* action[1].timingAge = 3 'mo'
* action[1].groupingBehavior = #logical-group
* action[1].selectionBehavior = #all 
* action[1].requiredBehavior = #must-unless-documented
* action[1].cardinalityBehavior = #single

//3 month vaccines
* action[1].action[0].title = "DTap administration at 3 months"
* action[1].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/dtap"
* action[1].action[0].extension[vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[1].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 2

* action[1].action[1].title = "RV1 administration at 3 months"
* action[1].action[1].definitionCanonical = "http://clinfhir/ActivityDefinition/rv1"
* action[1].action[1].extension[vacc-sequence].extension[series].valueString = "RV1"
* action[1].action[1].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

//5 month vaccines
* action[2].title = "5 month vaccinations"
* action[2].timingAge = 5 'mo'
* action[2].groupingBehavior = #logical-group
* action[2].selectionBehavior = #all 
* action[2].requiredBehavior = #must-unless-documented
* action[2].cardinalityBehavior = #single

* action[2].action[0].title = "DTap administration at 5 months"
* action[2].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/dtap"
* action[2].action[0].extension[vacc-sequence].extension[series].valueString = "DTaP-IPV-HepB/Hib"
* action[2].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 3

* action[2].action[1].title = "PCV10 administration at 5 months"
* action[2].action[1].definitionCanonical = "http://clinfhir/ActivityDefinition/pcv10"
* action[2].action[1].extension[vacc-sequence].extension[series].valueString = "PCV10"
* action[2].action[1].extension[vacc-sequence].extension[sequence].valuePositiveInt = 2

//12 month vaccines
* action[3].title = "12 month vaccinations"
* action[3].timingAge = 12 'mo'
* action[3].groupingBehavior = #logical-group
* action[3].selectionBehavior = #all 
* action[3].requiredBehavior = #must-unless-documented
* action[3].cardinalityBehavior = #single

* action[3].action[0].title = "PCV10 administration at 12 months"
* action[3].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/pcv10"
* action[3].action[0].extension[vacc-sequence].extension[series].valueString = "PCV10"
* action[3].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 3

* action[3].action[0].title = "MMR administration at 12 months"
* action[3].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/mmr"
* action[3].action[0].extension[vacc-sequence].extension[series].valueString = "MMR"
* action[3].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

//15 month vaccines
* action[4].title = "15 month vaccinations"
* action[4].timingAge = 15 'mo'
* action[4].groupingBehavior = #logical-group
* action[4].selectionBehavior = #all 
* action[4].requiredBehavior = #must-unless-documented
* action[4].cardinalityBehavior = #single

* action[4].action[0].title = "MMR administration at 15 months"
* action[4].action[0].definitionCanonical = "http://clinfhir/ActivityDefinition/mmr"
* action[4].action[0].extension[vacc-sequence].extension[series].valueString = "MMR"
* action[4].action[0].extension[vacc-sequence].extension[sequence].valuePositiveInt = 2

* action[4].action[1].title = "Hib administration at 15 months"
* action[4].action[1].definitionCanonical = "http://clinfhir/ActivityDefinition/hib"
* action[4].action[1].extension[vacc-sequence].extension[series].valueString = "HIB"
* action[4].action[1].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

* action[4].action[2].title = "VV administration at 15 months"
* action[4].action[2].definitionCanonical = "http://clinfhir/ActivityDefinition/vv"
* action[4].action[2].extension[vacc-sequence].extension[series].valueString = "VV"
* action[4].action[2].extension[vacc-sequence].extension[sequence].valuePositiveInt = 1

Instance: pat
InstanceOf: Patient
Description: "demo patient"
Usage: #example

* name.family = "Doe"
* name.given = "John"
* gender = #male
* birthDate = "2021-03-01"


Instance: imm1
InstanceOf: Immunization
Description: "First administration of DTaP-IPV-HepB/Hib"
Usage: #example

//an extension containing the url of the PlanDefinition that represents the paediatric protocol
* extension.url = "http://clinfhir.com/StructureDefinition/protocol"
* extension.valueUrl = "http://clinfhir.com/PlanDefinition/paediatric"

* status = #completed
* patient = Reference(pat)
* occurrenceDateTime = "2021-01-20"
* vaccineCode = $vaccCode#dtap "DTaP-IPV-HepB/Hib"
* protocolApplied.series = "DTaP-IPV-HepB/Hib"
* protocolApplied.doseNumberPositiveInt = 1


Instance: ir1
InstanceOf: PaedImmunizationRecommendation
Description: "An IR generated for a new born. Birth date 2021-01-01"
Usage: #example

* patient = Reference(pat)
* date = "2021-01-20"

//an extension containing the url of the PlanDefinition that represents the paediatric protocol
* extension.url = "http://clinfhir.com/StructureDefinition/protocol"
* extension.valueUrl = "http://clinfhir.com/PlanDefinition/paediatric"

//the recommendation for the 6 week DTaP-IPV-HepB/Hib vaccine
* recommendation[0].forecastStatus = $forecastStatus#due
* recommendation[0].vaccineCode =  $vaccCode#dtap "DTaP-IPV-HepB/Hib"
* recommendation[0].series = "DTaP-IPV-HepB/Hib"
* recommendation[0].doseNumberPositiveInt = 1
* recommendation[0].dateCriterion.code = http://loinc.org#30980-7   "Date due"
* recommendation[0].dateCriterion.value = "2021-01-14"      //age 6 weeks

//the 'disease covered' extensions
* recommendation[0].extension[disease-covered][0].valueCodeableConcept = SCT#397428000 "Diptheria"
* recommendation[0].extension[disease-covered][1].valueCodeableConcept = SCT#76902006 "Tetanus"
* recommendation[0].extension[disease-covered][2].valueCodeableConcept = SCT#27836007 "Pertussis"
* recommendation[0].extension[disease-covered][3].valueCodeableConcept = SCT#398102009 "Polio Myelitis"
* recommendation[0].extension[disease-covered][4].valueCodeableConcept = SCT#66071002 "Viral Hepatitis type B"
* recommendation[0].extension[disease-covered][5].valueCodeableConcept = SCT#91428005 "Haemophilus Influenzae infection"

//the recommendation for the 6 week PVC10
* recommendation[1].forecastStatus = $forecastStatus#due
* recommendation[1].vaccineCode =  $vaccCode#pcv10 "PCV10"
* recommendation[1].series = "pcv10"
* recommendation[1].doseNumberPositiveInt = 1
* recommendation[1].dateCriterion.code = http://loinc.org#30980-7   "Date due"
* recommendation[1].dateCriterion.value = "2021-01-14"      //age 6 weeks