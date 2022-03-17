// Author: Gregor Lichtner @glichtner
Profile: CertaintyOfEvidenceRating
Parent: ArtifactAssessment
Id: certainty-of-evidence-rating
Title: "Certainty of evidence rating"
Description: "Rating of a single outcome (evidence) underlying a clinical practice guideline recommendation"
* insert metadata(2022-03-11, #draft, 0.1.0)
* insert profile("This profile is used to define the certainty of evidence rating")
* artifact[x] only Reference
* artifactReference only Reference(OutcomeEvidence)
//* version 1..1 MS // TODO: uncomment if version
* extension contains
  ArtifactAssessmentVersion named version 1..1 MS and // TODO: replace by actual version field if added
  ArtifactAssessmentPublicationStatus named status 1..1 MS
* date 1..1
* content 1..* MS
* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #closed
* content contains
  certaintyOfEvidence 1..1 MS
  and riskOfBias 0..1 MS
  and inconsistency 0..1 MS
  and indirectness 0..1 MS
  and imprecision 0..1 MS
  and publicationBias 0..1 MS

* content[certaintyOfEvidence]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#Overall "Overall certainty"
  * classifier 1..1
  * classifier from vs-rating-certainty-of-evidence (required)

* content[riskOfBias]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#RiskOfBias "Risk of bias"
  * classifier 1..1
  * classifier from vs-rating-concern-degree (required)

* content[inconsistency]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#Inconsistency "Inconsistency"
  * classifier 1..1
  * classifier from vs-rating-concern-degree (required)

* content[indirectness]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#Indirectness "Indirectness"
  * classifier 1..1
  * classifier from vs-rating-concern-degree (required)

* content[imprecision]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#Imprecision "Imprecision"
  * classifier 1..1
  * classifier from vs-rating-concern-degree (required)

* content[publicationBias]
  * informationType 1..1
  * informationType = #rating
  * type 1..
  * type = $cs-certainty-type#PublicationBias "Publication bias"
  * classifier 1..1
  * classifier from vs-rating-concern-degree (required)

Instance: ExampleCertaintyOfEvidenceRating
InstanceOf: certainty-of-evidence-rating
Usage: #example
Title: "Example Certainty Of Evidence Rating"
Description: ""
* artifactReference = Reference(ExampleOutcomeEvidence)
* extension[version].valueString = "0.1.1"
* extension[status].valueCode = #active
* date = "2022-03-11"
* content[certaintyOfEvidence].classifier = $cs-certainty-rating#moderate "Moderate quality"
* content[riskOfBias].classifier = $cs-certainty-rating#serious-concern "serious concern"
* content[imprecision].classifier = $cs-certainty-rating#serious-concern "serious concern"