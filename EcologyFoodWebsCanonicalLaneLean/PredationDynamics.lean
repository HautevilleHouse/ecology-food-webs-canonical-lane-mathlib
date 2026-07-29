import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyFoodWebsCanonicalLaneLean.SpeciesBiomass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure PredationDynamicsPackage (B : SpeciesBiomassPackage) where
  predationRate : B.species → B.species → ℝ
  conversionEfficiency : B.species → ℝ
  attackRate : B.species → ℝ
  handlingTime : B.species → ℝ
  predationRateNonnegative : ∀ predator prey, predationRate predator prey ≥ 0
  conversionEfficiencyUnitInterval : ∀ s, 0 ≤ conversionEfficiency s ∧ conversionEfficiency s ≤ 1

structure PredationDynamicsEvidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) where
  predationRateNonnegativeClosed : ∀ predator prey, P.predationRate predator prey ≥ 0
  conversionEfficiencyUnitIntervalClosed : ∀ s, 0 ≤ P.conversionEfficiency s ∧ P.conversionEfficiency s ≤ 1

def PredationDynamicsClosed (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) : Prop :=
  (∀ predator prey, P.predationRate predator prey ≥ 0) ∧
  (∀ s, 0 ≤ P.conversionEfficiency s ∧ P.conversionEfficiency s ≤ 1)

theorem predation_dynamics_closed_from_evidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (E : PredationDynamicsEvidence B P) :
  PredationDynamicsClosed B P := by
  exact And.intro E.predationRateNonnegativeClosed E.conversionEfficiencyUnitIntervalClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse