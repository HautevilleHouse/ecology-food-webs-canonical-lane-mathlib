import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyFoodWebsCanonicalLaneLean.PredationDynamics

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure ConsumptionMatrixPackage (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) where
  consumptionMatrix : B.species → B.species → ℝ
  consumptionRateNonnegative : ∀ i j, consumptionMatrix i j ≥ 0
  feedingPreferencesNormalized : ∀ i, (∑' j, consumptionMatrix i j) = 1

structure ConsumptionMatrixEvidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) where
  consumptionRateNonnegativeClosed : ∀ i j, C.consumptionMatrix i j ≥ 0
  feedingPreferencesNormalizedClosed : ∀ i, (∑' j, C.consumptionMatrix i j) = 1

def ConsumptionMatrixClosed (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) : Prop :=
  (∀ i j, C.consumptionMatrix i j ≥ 0) ∧ (∀ i, (∑' j, C.consumptionMatrix i j) = 1)

theorem consumption_matrix_closed_from_evidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (E : ConsumptionMatrixEvidence B P C) :
  ConsumptionMatrixClosed B P C := by
  exact And.intro E.consumptionRateNonnegativeClosed E.feedingPreferencesNormalizedClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse