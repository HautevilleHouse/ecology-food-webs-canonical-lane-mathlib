import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure FoodWebConnectancePackage (T : TrophicStructurePackage) where
  totalLinks : ℕ
  totalPossibleLinks : ℕ
  connectance : ℝ
  connectanceComputed : connectance = (totalLinks : ℝ) / (totalPossibleLinks : ℝ)

structure FoodWebConnectanceEvidence {T : TrophicStructurePackage}
    (C : FoodWebConnectancePackage T) where
  connectanceComputedClosed : C.connectanceComputed

def FoodWebConnectanceClosed {T : TrophicStructurePackage}
    (C : FoodWebConnectancePackage T) : Prop :=
  C.connectanceComputed

theorem food_web_connectance_closed_from_evidence
    {T : TrophicStructurePackage} (C : FoodWebConnectancePackage T)
    (E : FoodWebConnectanceEvidence C) : FoodWebConnectanceClosed C := by
  exact E.connectanceComputedClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse