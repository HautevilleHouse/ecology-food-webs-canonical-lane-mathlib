import Mathlib.Data.Finset.Basic

/-!
# Species Richness Package
-/

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure SpeciesRichnessPackage where
  speciesCount : Nat
  area : ℝ
  richnessModel : Prop
  speciesAreaRelationship : Prop

structure SpeciesRichnessEvidence (R : SpeciesRichnessPackage) where
  richnessModelClosed : R.richnessModel
  speciesAreaRelationshipClosed : R.speciesAreaRelationship

def SpeciesRichnessClosed (R : SpeciesRichnessPackage) : Prop :=
  R.richnessModel ∧ R.speciesAreaRelationship

theorem species_richness_closed_from_evidence
    (R : SpeciesRichnessPackage) (E : SpeciesRichnessEvidence R) :
    SpeciesRichnessClosed R := by
  exact And.intro E.richnessModelClosed E.speciesAreaRelationshipClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse