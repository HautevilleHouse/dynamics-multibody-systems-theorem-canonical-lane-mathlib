import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure MultibodySystemSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MultibodySystemAdmittedObject where
  space : MultibodySystemSpace
  closedConstrained : Prop
  simplyConnected : Prop
  constraintModel : Type
  constraintTopology : TopologicalSpace constraintModel
  homeomorphicToConstraint : Prop
  conclusion : homeomorphicToConstraint

structure MultibodySystemEndgameState where
  object : MultibodySystemAdmittedObject

def MultibodySystemWitnessClosed (O : MultibodySystemAdmittedObject) : Prop :=
  O.homeomorphicToConstraint

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse