Alias: $vaccSequence = http://clinfhir.com/StructureDefinition/vacc-sequence

Profile:        NzImmunization
Parent:         Immunization
Id:             nz-immunization
Description:          "Immunization resource. Records a single administration of a vaccine"

* ^url = "http://hl7.org.nz/fhir/StructureDefinition/nz-immunization"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

/*
* ^purpose = "To form the base plan upon which individual immunization recommendations for a patient can be derived."
* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Immunization plan</div>"

* action.extension contains
    $vaccSequence named vacc-sequence 0..1 

    */