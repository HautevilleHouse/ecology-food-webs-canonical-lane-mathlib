import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure FunctionalResponsePackage (T : TrophicStructurePackage) where
  attackRates : T.species → T.species → ℝ
  handlingTimes : T.species → T.species → ℝ
  functionalResponseType : Type u
  predationRateFormula : Prop

structure FunctionalResponseEvidence {T : TrophicStructurePackage}
    (F : FunctionalResponsePackage T) where
  attackRatesDefinedClosed : True
  handlingTimesDefinedClosed : True
  predationRateFormulaClosed : F.predationRateFormula

def FunctionalResponseClosed {T : TrophicStructurePackage}
    (F : FunctionalResponsePackage T) : Prop :=
  F.predationRateFormula

theorem functional_response_closed_from_evidence
    {T : TrophicStructurePackage} (F : FunctionalResponsePackage T)
    (E : FunctionalResponseEvidence F) : FunctionalResponseClosed F := by
  exact E.predationRateFormulaClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse