import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure DynamicModelPackage (T : TrophicStructurePackage) where
  populationDynamics : Type u
  growthRates : T.species → ℝ
  interactionCoefficients : T.species → T.species → ℝ
  modelEquations : Prop

structure DynamicModelEvidence {T : TrophicStructurePackage}
    (M : DynamicModelPackage T) where
  growthRatesDefinedClosed : M.growthRates = M.growthRates
  interactionCoefficientsDefinedClosed : M.interactionCoefficients = M.interactionCoefficients
  modelEquationsClosed : M.modelEquations

def DynamicModelClosed {T : TrophicStructurePackage}
    (M : DynamicModelPackage T) : Prop :=
  M.modelEquations

theorem dynamic_model_closed_from_evidence
    {T : TrophicStructurePackage} (M : DynamicModelPackage T)
    (E : DynamicModelEvidence M) : DynamicModelClosed M := by
  exact E.modelEquationsClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse