// Author: Gregor Lichtner @glichtner
Profile: Recommendation
Parent: CPGStrategyDefinition
Id: recommendation
* insert metadata(2022-10-03, #draft, 0.1.0)
* insert profile("This profile is used to group separate recommendations in the context of a clinical practice guideline recommendation.")
* extension[cpg-knowledgeCapability] 1..1
  * valueCode 1..1
  * valueCode = $cs-cpg-knowledgeCapability#computable "Computable"
* extension[cpg-knowledgeRepresentationLevel] 1..1
  * valueCode 1..1
  * valueCode = $cs-cpg-knowledgeRepresentationLevel#structured "Structured"
* action
  * obeys selection-behavior-unique-or-no-value
  * definitionCanonical 1..1
  * definition[x] only canonical
  * definitionCanonical only Canonical(RecommendationPlan)
  * selectionBehavior 1..1 MS
  * code 1..1 MS
* insert recommendation-related-artifacts

Instance: ExampleRecommendation
InstanceOf: recommendation
Usage: #example
Title: "recommendation"
Description: "Recommendation"
* action[+]
  * title = "example recommendation"
  * code = $cs-common-process#guideline-based-care
  * description = "Example recommendation"
  * definitionCanonical = Canonical(ExampleRecommendationPlan)
  * selectionBehavior = #all
* name = "Recommendation"
* title = "Recommendation"
* version = "1.0"
* date = "2022-02-14"
* status = #active
* description = "Example Recommendation"
* insert canonical-url(example/recommendation-plan/example-recommendation)
* experimental = true
* publisher = "CPGonEBMonFHIR"
* relatedArtifact[recommendationJustification].resourceReference = Reference(ExampleRecommendationJustification)
* relatedArtifact[recommendationCitation].resourceReference = Reference(ExampleRecommendationCitation)
* relatedArtifact[guidelineCitation].resourceReference = Reference(ExampleGuidelineCitation)