Extension: VaccSequence
Id: vacc-sequence
Description: "The sequence of this vaccination within the plan"

* ^url = "http://clinfhir.com/StructureDefinition/vacc-sequence"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "PlanDefinition.action.action"

* extension contains
    series 1..1 and
    sequence 1..1

* extension[series].url = "series" (exactly)
* extension[series].value[x]  only string
* extension[series] ^short = "The name of the sequence of vaccines. Defaults to the vaccine antigen/s"    

* extension[sequence].url = "sequence" (exactly)
* extension[sequence].value[x]  only positiveInt
* extension[sequence] ^short = "The sequence of this vaccine administration within the series"    

Extension: PlandefinitionUrl
Id: plandefinition-url
Description: "The canonical url of the Plan definition upon which this resource (ImmunizationRecommendation or Immunization) is based"

* ^url = "http://clinfhir.com/StructureDefinition/plandefinition-url"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "ImmnunizationRecommendation"

* ^context[1].type = #element
* ^context[1].expression = "Immunization"

* value[x] only url

Extension: DiseaseCovered
Id: disease-covered
Description: "The disease which a vaccine coveres. Needed in ActivityDefinition and ImmunizationRecommendation as the cardinality there is only single."

* ^url = "http://clinfhir.com/StructureDefinition/disease-covered"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context.type = #element
* ^context.expression = "ActivityDefinition"

* ^context[1].type = #element
* ^context[1].expression = "ImmunizationRecommendation.recommendation"

* value[x] only CodeableConcept
* valueCodeableConcept from disease-diseaseCovered
