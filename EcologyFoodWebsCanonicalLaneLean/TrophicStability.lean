import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EcologyFoodWebsCanonicalLaneLean.MassBalancePDE

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure TrophicStabilityPackage (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) where
  equilibriumExists : Prop
  localStability : Prop
  convergeToEquilibrium : Prop

structure TrophicStabilityEvidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) (T : TrophicStabilityPackage B P C M) where
  equilibriumExistsClosed : T.equilibriumExists
  localStabilityClosed : T.localStability
  convergeToEquilibriumClosed : T.convergeToEquilibrium

def TrophicStabilityClosed (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) (T : TrophicStabilityPackage B P C M) : Prop :=
  T.equilibriumExists ∧ T.localStability ∧ T.convergeToEquilibrium

theorem trophic_stability_closed_from_evidence (B : SpeciesBiomassPackage) (P : PredationDynamicsPackage B) (C : ConsumptionMatrixPackage B P) (M : MassBalancePDEPackage B P C) (T : TrophicStabilityPackage B P C M) (E : TrophicStabilityEvidence B P C M T) :
  TrophicStabilityClosed B P C M T := by
  exact And.intro E.equilibriumExistsClosed (And.intro E.localStabilityClosed E.convergeToEquilibriumClosed)

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse