#!/usr/bin/env node
//generate a catchup


let fs = require('fs');

let planFileName = "fsh-generated/resources/PlanDefinition-pd2.json"
let diseaseCoveredExtUrl = "http://clinfhir.com/StructureDefinition/disease-covered"


let patientAgeInDays = 18*30;    //13 months old
let hashHxDisease = {}     //key on disease. Contains array of admin age

//load the plandefinition
let contents = fs.readFileSync(planFileName).toString();
let plan = JSON.parse(contents)

//create a hash of ActivityDefinitions by url (needed for the plan action)
//also create a hash of what diseases are covered by which vaccine. We'll
//use this when pulling in the immunization history
//finally, need the list of immunizations the person has received

let hashAD = {};    //key is ad.url, contents the ActivityDefinition
let hashVaccine = {};       //key is vaccine code, content are the diseases covered by this code
let arImmunizations = [];   //all the Immunization resources (assume they are the same patient)
let arFiles = fs.readdirSync("fsh-generated/resources");
arFiles.forEach(function(name){
    if (name.indexOf("ActivityDefinition") > -1 || name.indexOf("Immunization") > -1  ) {
        let fullFileName = "fsh-generated/resources/"+ name;
        let adContents = fs.readFileSync(fullFileName).toString();

        let json = JSON.parse(adContents)
        switch (json.resourceType) {
            case "ActivityDefinition" :
                hashAD[json.url] = json;
                //create the has of diseases covered by vaccine
                let code = json.productCodeableConcept.coding[0].code
                if (! hashVaccine[code]) {
                    //only need to do it once...
                    hashVaccine[code] = getDiseases(json)
                }
                break;
            case "Immunization" :
                arImmunizations.push(json)
                break;
        }
    }
})


//now, get all the immunization resources for the patient and generate the history of diseases covered
//this is a simple has for each disease giving the number of times a vaccine that protected against
//that disease was given. For a smarter algorithm, we record the date given and make sure the 
//administration intervals were correct..
//console.log(arImmunizations)
arImmunizations.forEach(function(imm){
    let code = imm.vaccineCode.coding[0].code;      //the vaccine code
    if (hashVaccine[code]) {
        //this is a list of all diseases covered by this vaccine
        hashVaccine[code].forEach(function(dis){
            //console.log(dis)
            let diseaseCode = dis.code
            hashHxDisease[diseaseCode] = hashHxDisease[diseaseCode] || {name:dis.display, due:0, received:0}
            hashHxDisease[diseaseCode].received ++;
        })
    } else {
        console.log('no data for '+ code)
    }
})



/**
 * Now we can cycle through all the ages in the plan. For each age, we check that the age due is
 * less than or equal to the patients current age. If it is, it means that the person should have
 * received that set of vaccines, so we get the vaccines to be given, and from that the diseases 
 * that are to be covered.
 * We then update the hashHxDisease[diseaseCode].due number. We can then compare the due and the received...
 */


//top level actions (vaccines to be given at this age)
plan.action.forEach(function(topLevelAction){  
    //get the age to administer in days
    let age = topLevelAction.timingAge.value;      //age in weeks or months
    let units = topLevelAction.timingAge.code;      //the units for the age

    let ageToAdminister = age * 7;  //assume weeks
    if (units == "mo") {
        ageToAdminister = age * 30
    }

    if (ageToAdminister < patientAgeInDays) {
        //these vaccines should have been administered if the person is up to date...    
        topLevelAction.action.forEach(function(detailAction){
            let adUrl = detailAction.definitionCanonical
            
            let ad = hashAD[adUrl];     //the ActivityDefinition representing the vaccine
            if (!ad) {
                console.log(">>>>>>>> Error: AD not found for url:" + adUrl)
                //the app will crash and burn if ad is null. Would mean the plan is wrong..
            } 
    
            //get the diseases that this ActivityDefinition represents
            let diseases = getDiseases(ad)
            if (diseases.length > 0) {
                diseases.forEach(function(dis){
                    let diseaseCode = dis.code;     //the code of the disease                    
                    hashHxDisease[diseaseCode] = hashHxDisease[diseaseCode] || {name:dis.display,due:0,received:0}
                    hashHxDisease[diseaseCode].due ++                    
                })
            }     
        })
    }
})

//This now has the number of 
console.log(hashHxDisease)

//get the list of diseases covered by an ActivityDefinition
function getDiseases(ad) {
    let diseases = []
    if (ad.extension) {
        ad.extension.forEach(function(ext){
            if (ext.url == diseaseCoveredExtUrl) {
                let code = ext.valueCodeableConcept.coding[0].code;
                let display = ext.valueCodeableConcept.coding[0].display;
                diseases.push({code:code,display:display})
            }
        })
    }
    return diseases;
}