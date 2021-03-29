
Profile:        PaedImmunizationRecommendation
Parent:         ImmunizationRecommendation
Id:             paedimmrec
Title:          "Paediatric Immunization Recommendation"
Description:    "An immunizationRecommendation derived from the paediatric immunization PlanDefinition and applied to an invividual"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/paediatric-immunization-plan"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunization plan</div>"

* recommendation.extension contains
    $diseaseCovered named disease-covered 1..* 