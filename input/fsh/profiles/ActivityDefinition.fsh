
Alias: $diseaseCovered = http://clinfhir.com/StructureDefinition/disease-covered

Profile:        ImmunizationAction
Parent:         ActivityDefinition
Id:             immactivity
Title:          "Paediatric Immunization activity"
Description:    "The ActivityDefinition used by the New Zealand paediatric immunization plan to describe a vaccine administration"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/immunization-action"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunization activity</div>"

* extension contains
    $diseaseCovered named disease-covered 0..*