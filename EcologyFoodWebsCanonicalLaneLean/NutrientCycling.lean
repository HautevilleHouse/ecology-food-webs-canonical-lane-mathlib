import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebs

structure NutrientCyclingPackage {T : TrophicLevelPackage} {C : ConsumptionDynamicsPackage T} where
  decompositionRate : Prop
  nutrientUptake : Prop
  recyclingEfficiency : Prop
  limitationEffect : Prop

structure NutrientCyclingEvidence {T : TrophicLevelPackage} {C : ConsumptionDynamicsPackage T}
    (N : NutrientCyclingPackage T C) where
  decompositionRateClosed : N.decompositionRate
  nutrientUptakeClosed : N.nutrientUptake
  recyclingEfficiencyClosed : N.recyclingEfficiency
  limitationEffectClosed : N.limitationEffect

def NutrientCyclingClosed {T : TrophicLevelPackage} {C : ConsumptionDynamicsPackage T}
    (N : NutrientCyclingPackage T C) : Prop :=
  N.decompositionRate ∧ N.nutrientUptake ∧ N.recyclingEfficiency ∧ N.limitationEffect

theorem nutrient_cycling_closed_from_evidence
    {T : TrophicLevelPackage} {C : ConsumptionDynamicsPackage T}
    (N : NutrientCyclingPackage T C) (E : NutrientCyclingEvidence N) :
    NutrientCyclingClosed N := by
  exact And.intro E.decompositionRateClosed
    (And.intro E.nutrientUptakeClosed
      (And.intro E.recyclingEfficiencyClosed E.limitationEffectClosed))

end EcologyFoodWebs
end HautevilleHouse
