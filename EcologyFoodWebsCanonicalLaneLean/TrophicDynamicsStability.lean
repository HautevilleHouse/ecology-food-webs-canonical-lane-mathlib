import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure PopulationDynamics where
  growthRate : String → Float
  carryingCapacity : String → Float
  predationPressure : (String × String) → Float

structure TrophicDynamicsPackage (P : PopulationDynamics) where
  equilibriumExists : Prop
  lyapunovStable : Prop
  persistent : Prop

structure TrophicDynamicsEvidence {P : PopulationDynamics}
    (D : TrophicDynamicsPackage P) where
  equilibriumExistsClosed : D.equilibriumExists
  lyapunovStableClosed : D.lyapunovStable
  persistentClosed : D.persistent

def TrophicDynamicsClosed {P : PopulationDynamics}
    (D : TrophicDynamicsPackage P) : Prop :=
  D.equilibriumExists ∧ D.lyapunovStable ∧ D.persistent

theorem trophic_dynamics_closed_from_evidence {P : PopulationDynamics}
    (D : TrophicDynamicsPackage P) (E : TrophicDynamicsEvidence D) :
    TrophicDynamicsClosed D := by
  exact And.intro E.equilibriumExistsClosed (And.intro E.lyapunovStableClosed E.persistentClosed)

structure StabilityCriteria where
  equilibriumCondition : Prop
  lyapunovFunction : Type
  lyapunovCondition : Prop
  persistenceBound : Prop
  equilibriumConditionTerm : equilibriumCondition
  lyapunovFunctionTerm : lyapunovFunction
  lyapunovConditionTerm : lyapunovCondition
  persistenceBoundTerm : persistenceBound

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse