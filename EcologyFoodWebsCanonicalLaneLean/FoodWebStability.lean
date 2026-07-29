import EcologyFoodWebsCanonicalLaneLean.SpeciesRichness

/-!
# Food Web Stability Package
-/

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure FoodWebStabilityPackage (S : FoodWebSpeciesRichnessPackage) where
  connectanceStability : Prop
  resilienceToPerturbation : Prop
  trophicCascadeBounds : Prop
  omnivoryStabilizingEffect : Prop

structure FoodWebStabilityEvidence {S : FoodWebSpeciesRichnessPackage} (St : FoodWebStabilityPackage S) where
  connectanceStabilityClosed : St.connectanceStability
  resilienceToPerturbationClosed : St.resilienceToPerturbation
  trophicCascadeBoundsClosed : St.trophicCascadeBounds
  omnivoryStabilizingEffectClosed : St.omnivoryStabilizingEffect

def FoodWebStabilityClosed {S : FoodWebSpeciesRichnessPackage} (St : FoodWebStabilityPackage S) : Prop :=
  St.connectanceStability ∧ St.resilienceToPerturbation ∧ St.trophicCascadeBounds ∧ St.omnivoryStabilizingEffect

theorem food_web_stability_closed_from_evidence
    {S : FoodWebSpeciesRichnessPackage}
    (St : FoodWebStabilityPackage S) (E : FoodWebStabilityEvidence St) :
    FoodWebStabilityClosed St := by
  exact And.intro E.connectanceStabilityClosed
    (And.intro E.resilienceToPerturbationClosed
      (And.intro E.trophicCascadeBoundsClosed E.omnivoryStabilizingEffectClosed))

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse