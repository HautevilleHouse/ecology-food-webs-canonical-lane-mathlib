import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebs

structure ConsumptionDynamicsPackage {T : TrophicLevelPackage} where
  predatorPreyInteraction : Prop
  functionalResponse : Prop
  numericalResponse : Prop
  stabilityCondition : Prop

structure ConsumptionDynamicsEvidence {T : TrophicLevelPackage} (C : ConsumptionDynamicsPackage T) where
  predatorPreyInteractionClosed : C.predatorPreyInteraction
  functionalResponseClosed : C.functionalResponse
  numericalResponseClosed : C.numericalResponse
  stabilityConditionClosed : C.stabilityCondition

def ConsumptionDynamicsClosed {T : TrophicLevelPackage} (C : ConsumptionDynamicsPackage T) : Prop :=
  C.predatorPreyInteraction ∧ C.functionalResponse ∧ C.numericalResponse ∧ C.stabilityCondition

theorem consumption_dynamics_closed_from_evidence
    {T : TrophicLevelPackage} (C : ConsumptionDynamicsPackage T)
    (E : ConsumptionDynamicsEvidence C) : ConsumptionDynamicsClosed C := by
  exact And.intro E.predatorPreyInteractionClosed
    (And.intro E.functionalResponseClosed
      (And.intro E.numericalResponseClosed E.stabilityConditionClosed))

end EcologyFoodWebs
end HautevilleHouse
