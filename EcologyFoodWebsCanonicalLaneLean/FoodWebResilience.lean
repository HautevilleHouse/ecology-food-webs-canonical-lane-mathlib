import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure DisturbanceEvent where
  type : String
  magnitude : Float
  duration : Float

structure FoodWebResiliencePackage (D : DisturbanceEvent) where
  resistance : Prop
  recoveryTime : Float
  resilienceThreshold : Float
  recoveredAfterDisturbance : Prop

structure FoodWebResilienceEvidence {D : DisturbanceEvent}
    (R : FoodWebResiliencePackage D) where
  resistanceClosed : R.resistance
  recoveredAfterDisturbanceClosed : R.recoveredAfterDisturbance

def FoodWebResilienceClosed {D : DisturbanceEvent}
    (R : FoodWebResiliencePackage D) : Prop :=
  R.resistance ∧ R.recoveredAfterDisturbance

theorem food_web_resilience_closed_from_evidence {D : DisturbanceEvent}
    (R : FoodWebResiliencePackage D) (E : FoodWebResilienceEvidence R) :
    FoodWebResilienceClosed R := by
  exact And.intro E.resistanceClosed E.recoveredAfterDisturbanceClosed

structure ResilienceMetric where
  resilienceIndex : Float
  robustness : Prop
  adaptivePotential : Prop
  resilienceIndexTerm : resilienceIndex
  robustnessTerm : robustness
  adaptivePotentialTerm : adaptivePotential

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse