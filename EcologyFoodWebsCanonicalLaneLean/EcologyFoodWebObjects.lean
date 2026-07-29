import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure FoodWeb where
  species : Type
  trophicLinks : List (species × species)
  biomass : species → ℝ
  productivity : species → ℝ
  stability : Prop

structure FoodWebAdmittedObject where
  web : FoodWeb
  connected : Prop
  stableEquilibrium : Prop
  carryingCapacity : species → ℝ
  conclusion : stableEquilibrium

structure FoodWebEndgameState where
  object : FoodWebAdmittedObject

def FoodWebWitnessClosed (O : FoodWebAdmittedObject) : Prop :=
  O.stableEquilibrium

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse