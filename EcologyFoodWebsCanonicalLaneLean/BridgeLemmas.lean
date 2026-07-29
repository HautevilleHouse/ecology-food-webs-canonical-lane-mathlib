import canonicalLaneMathlib.Bridge
import EcologyFoodWebsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FoodWebWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse