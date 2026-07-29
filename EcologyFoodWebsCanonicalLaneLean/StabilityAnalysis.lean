import EcologyFoodWebsCanonicalLaneLean.TrophicStructure

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure StabilityPackage where
  lotkaVolterraEquations : Prop
  equilibriumExistence : Prop
  localAsymptoticStability : Prop
  resilience : ℝ

structure StabilityEvidence (S : StabilityPackage) where
  lotkaVolterraEquationsClosed : S.lotkaVolterraEquations
  equilibriumExistenceClosed : S.equilibriumExistence
  localAsymptoticStabilityClosed : S.localAsymptoticStability
  resilienceClosed : S.resilience > 0

def StabilityClosed (S : StabilityPackage) : Prop :=
  S.lotkaVolterraEquations ∧ S.equilibriumExistence ∧ S.localAsymptoticStability ∧ S.resilience > 0

theorem stability_closed_from_evidence (S : StabilityPackage) (E : StabilityEvidence S) :
    StabilityClosed S := by
  exact And.intro E.lotkaVolterraEquationsClosed
    (And.intro E.equilibriumExistenceClosed
      (And.intro E.localAsymptoticStabilityClosed E.resilienceClosed))

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse