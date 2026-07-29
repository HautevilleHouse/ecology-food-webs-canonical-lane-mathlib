import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure KeystoneSpecies where
  name : String
  preySpecies : List String
  predatorSpecies : List String
  impactFactor : Float

structure KeystonePredationPackage (K : KeystoneSpecies) where
  disproportionateEffect : Prop
  communityStabilization : Prop
  trophicCascadeInduced : Prop
  keystoneEffectThreshold : Float

structure KeystonePredationEvidence {K : KeystoneSpecies}
    (Pkg : KeystonePredationPackage K) where
  disproportionateEffectClosed : Pkg.disproportionateEffect
  communityStabilizationClosed : Pkg.communityStabilization
  trophicCascadeInducedClosed : Pkg.trophicCascadeInduced

def KeystonePredationClosed {K : KeystoneSpecies}
    (Pkg : KeystonePredationPackage K) : Prop :=
  Pkg.disproportionateEffect ∧ Pkg.communityStabilization ∧ Pkg.trophicCascadeInduced

theorem keystone_predation_closed_from_evidence {K : KeystoneSpecies}
    (Pkg : KeystonePredationPackage K) (E : KeystonePredationEvidence Pkg) :
    KeystonePredationClosed Pkg := by
  exact And.intro E.disproportionateEffectClosed
    (And.intro E.communityStabilizationClosed E.trophicCascadeInducedClosed)

structure KeystoneMechanism where
  predationRate : Float
  preyVulnerability : Float
  alternativePrey : List String
  predationRateTerm : predationRate
  preyVulnerabilityTerm : preyVulnerability

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse