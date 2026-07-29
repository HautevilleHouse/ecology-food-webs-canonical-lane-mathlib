import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure SpeciesBiomassPackage where
  species : Type u
  biomass : species → ℝ
  growthRate : species → ℝ
  carryingCapacity : species → ℝ
  biomassNonnegative : ∀ s, biomass s ≥ 0
  growthRateFinite : ∀ s, growthRate s ≠ ∞

structure SpeciesBiomassEvidence (B : SpeciesBiomassPackage) where
  biomassNonnegativeClosed : ∀ s, B.biomass s ≥ 0
  growthRateFiniteClosed : ∀ s, B.growthRate s ≠ ∞

def SpeciesBiomassClosed (B : SpeciesBiomassPackage) : Prop :=
  (∀ s, B.biomass s ≥ 0) ∧ (∀ s, B.growthRate s ≠ ∞)

theorem species_biomass_closed_from_evidence (B : SpeciesBiomassPackage) (E : SpeciesBiomassEvidence B) :
  SpeciesBiomassClosed B := by
  exact And.intro E.biomassNonnegativeClosed E.growthRateFiniteClosed

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse