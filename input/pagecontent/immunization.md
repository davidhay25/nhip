Summary of Immunization functionality

### Architecture

The Immunization registry exposes a FHIR based RESTful API that clients use to query the registry and to submit reports of vaccine administration

### API

Key API functionality includes

* Retrieve Immunization history for an individual using the NHI
* Save vaccine administration information to the registry
* Retrieve the list of vaccinations that a person should receive. 
* Retrieve a copy of the current national Immunization programme

### Resources

The resources involved in the Immunization program are:


* [PlanDefinition](StructureDefinition-paedplan.html) which defines the national plan
* [ActivityDefinition](StructureDefinition-immactivity.html) which define the individual vaccine administrations within the plan
* [ImmunizationRecommendation](StructureDefinition-paedimmrec.html) which represents the plan applied to an individual
* [Immunization](StructureDefinition-nz-immunization.html) used to share the administration of a vaccine

### Overall process summary

It is expected that the overall process will flow as follows.

* A client retrieves the Immunization recommendations from the registry in the form of an ImmunizationRecommendation resource. This resource is generated from the PlanDefinition. Unless the generation process also takes into account the immunization history of the patient, it will only change when the Plan changes. They may use this as the basis for generating the recalls for the patient to have the vaccine administrations
* The patient receives one or more vaccine administrations. For each vaccine administered, a separate Immunization resource is created and sent to the registry. If the registry is able to use immunization history when generating the recommendations, then it might be useful for the client to retrieve an updated set of recommendations and update their follow up with the patient appropriately


### Structure of the Plan

The plan is represented using a PlanDefinition resource for the overall plan, and ActivityDefinition resources for the individual vaccine administrations. The components of the plan are represented by the action element of PlanDefinition is a 2 layer hierarchy with the top layer representing the age of administration of the vaccines, and the second nested layer containing the individual vaccines to be administered, with administration data defined by ActivityDefinition resources.

For example:

* 6 week vaccines
  * DTaP-IPV-HepB/Hib
  * PCV10
  * RV1
* 3 month vaccines
  * DTaP-IPV-HepB/Hib
  * RV1
* 5 month vaccines
  * DTaP-IPV-HepB/Hib
  * PCV10
  * RV1



### Generating recommendations from the plan 

The ImmunizationRecommended resource is generated directly from the PlanDefinition / ActionDefinition resources.

For a patient of a given age:

* Process the top level actions in the PlanDefinition. For each top level action (representing an age due):
    * Is the age due of the action (timingAge) greater than the patients current age? If it is then generate a recommendation in the ImmunizationRecommendation.recommendation element. 
        * Populate the dateCriterion by calculating the dateCriterion.value (which is the date due) from the difference between the patients age and the date due from the PlanDefinition.action. The dateCriterion.code is set to the loinc code 30980-7 (date imm due) or a possibly a SNOMED equivalent
        * Iterate though the child actions (representing the individual vaccines in the plan), locate the ActivityDefinition it references and place the vaccine code (ActivityDefinition.productCodeableConcept) in the recommendation.vaccineCode element
        * Also populate the series and doseNumber elements, plus the disease covered extension. 

There is a script in the IG build process that performs this process, creating an ImmunizationRecommendation suitable for a new born. The result is at the bottom of the [example page](paedplan.html) - which also has a couple of different renderings of the plan - one by age of administration and the other by vaccine.


### Personalizing the recommendation

Ideally, the process that generates the recommendations also considers the patient immunization history to determine 'missed' immunizations. This will likely be be a non trivial process.

One possibility is that the Immunization resource has the series and doseNumber elements, so the registry could ensure there are existing Immunization resources (or their persistence) that match.

Another possibility which is less brittle could be to approach this from a disease basis. ie

* figure out the patients age
* calculate the number of doses of a vaccine to protect against that disease that there is on record
* From that the difference may be calculated, and suitable vaccines recommended


A common difficulty is how to represent the 'catch ups' in the recommendation - they can effect the whole timetable. It may be a better approach to identify the 'missing' vaccinations and have the client make timetable adjustments. Perhaps indicating this by an extension on recommendation.

To support this, you might allow the client to update the recommendation and store that in the registry (rather than creating it from the Plan each time it is requested). Might also want to encourage clients to upload Immunization resources if the registry data is not up to date.
