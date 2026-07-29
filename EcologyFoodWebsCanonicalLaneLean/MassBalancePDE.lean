import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyFoodWebsCanonicalLaneLean.ConsumptionMatrix

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure MassBalancePDEPackage (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) where
  timeParameter : Type u
  biomassAtTime : timeParameter → B.species → ℝ
  growthTerm : B.species → ℝ
  deathTerm : B.species → ℝ
  predationLossTerm : B.species → ℝ
  predationGainTerm : B.species → ℝ
  massBalanceEquation : Prop

structure MassBalancePDEEvidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) where
  massBalanceEquationClosed : M.massBalanceEquation

def MassBalancePDEClosed (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) : Prop :=
  M.massBalanceEquation

theorem mass_balance_pde_closed_from_evidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) (E : MassBalancePDEEvidence B P C M) :
  MassBalancePDEClosed B P C M := by
  exact E.massBalanceEquationClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse