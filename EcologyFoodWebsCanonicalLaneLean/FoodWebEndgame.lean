import EcologyFoodWebsCanonicalLaneLean.BridgeLemmas
import EcologyFoodWebsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

def ConstrainedFoodWebClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_food_web_endgame (A : AdmissibleClass) :
    ConstrainedFoodWebClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse