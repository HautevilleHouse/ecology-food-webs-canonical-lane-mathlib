import Mathlib.Data.Finset.Basic

/-!
# Trophic Level Package
-/

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure TrophicLevelPackage where
  levelCount : Nat
  trophicLevelFunction : String → ℕ
  herbivoreCarnivoreRatio : ℝ
  omnivoryDefined : Prop

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse