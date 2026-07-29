import EcologyFoodWebsCanonicalLaneLean.TrophicLevel
import Mathlib.Data.Finset.Basic

/-!
# Food Web Structure Package
-/

namespace HautevilleHouse
namespace EcologyFoodWebsCanonicalLaneLean

structure FoodWebStructurePackage (T : TrophicLevelPackage) where
  speciesSet : Finset String
  adjacencyMatrix : speciesSet → speciesSet → Prop
  directedGraphAcyclic : Prop
  basalSpeciesDefined : Prop
  topPredatorsIdentified : Prop

structure FoodWebStructureEvidence {T : TrophicLevelPackage} (W : FoodWebStructurePackage T) where
  directedGraphAcyclicClosed : W.directedGraphAcyclic
  basalSpeciesDefinedClosed : W.basalSpeciesDefined
  topPredatorsIdentifiedClosed : W.topPredatorsIdentified

def FoodWebStructureClosed {T : TrophicLevelPackage} (W : FoodWebStructurePackage T) : Prop :=
  W.directedGraphAcyclic ∧ W.basalSpeciesDefined ∧ W.topPredatorsIdentified

theorem food_web_structure_closed_from_evidence
    {T : TrophicLevelPackage}
    (W : FoodWebStructurePackage T) (E : FoodWebStructureEvidence W) :
    FoodWebStructureClosed W := by
  exact And.intro E.directedGraphAcyclicClosed
    (And.intro E.basalSpeciesDefinedClosed E.topPredatorsIdentifiedClosed)

end EcologyFoodWebsCanonicalLaneLean
end HautevilleHouse