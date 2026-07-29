import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyFoodWebs

structure TrophicLevelPackage where
  producerBiomass : Prop
  primaryConsumerBiomass : Prop
  secondaryConsumerBiomass : Prop
  trophicTransferEfficiency : Prop

structure TrophicLevelEvidence (T : TrophicLevelPackage) where
  producerBiomassClosed : T.producerBiomass
  primaryConsumerBiomassClosed : T.primaryConsumerBiomass
  secondaryConsumerBiomassClosed : T.secondaryConsumerBiomass
  trophicTransferEfficiencyClosed : T.trophicTransferEfficiency

def TrophicLevelClosed (T : TrophicLevelPackage) : Prop :=
  T.producerBiomass ∧ T.primaryConsumerBiomass ∧ T.secondaryConsumerBiomass ∧ T.trophicTransferEfficiency

theorem trophic_level_closed_from_evidence (T : TrophicLevelPackage) (E : TrophicLevelEvidence T) :
    TrophicLevelClosed T := by
  exact And.intro E.producerBiomassClosed
    (And.intro E.primaryConsumerBiomassClosed
      (And.intro E.secondaryConsumerBiomassClosed E.trophicTransferEfficiencyClosed))

end EcologyFoodWebs
end HautevilleHouse
