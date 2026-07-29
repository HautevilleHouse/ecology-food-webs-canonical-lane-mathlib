import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure TrophicLink where
  predator : String
  prey : String
  interactionStrength : Float
  linkType : String

definition predation : Prop := True

structure SpeciesNode where
  name : String
  trophicLevel : Nat
  biomass : Float
  degree : Nat

structure SpeciesInteractionPackage where
  nodes : List SpeciesNode
  edges : List TrophicLink
  webConnected : Prop
  trophicChainLength : Nat
  interactionStable : Prop

structure SpeciesInteractionEvidence (S : SpeciesInteractionPackage) where
  webConnectedClosed : S.webConnected
  trophicChainLengthClosed : S.trophicChainLength ≥ 1
  interactionStableClosed : S.interactionStable

def SpeciesInteractionClosed (S : SpeciesInteractionPackage) : Prop :=
  S.webConnected ∧ S.trophicChainLength ≥ 1 ∧ S.interactionStable

theorem species_interaction_closed_from_evidence (S : SpeciesInteractionPackage)
    (E : SpeciesInteractionEvidence S) : SpeciesInteractionClosed S := by
  exact And.intro E.webConnectedClosed (And.intro E.trophicChainLengthClosed E.interactionStableClosed)

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse