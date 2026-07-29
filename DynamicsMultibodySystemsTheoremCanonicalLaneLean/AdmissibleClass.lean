import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MultibodyAdmittedObject where
  objectType : String
  constraintsSatisfied : Prop
  dynamicsResolved : Prop
  conclusion : constraintsSatisfied ∧ dynamicsResolved

structure MultibodyEndgameState where
  object : MultibodyAdmittedObject

def MultibodyWitnessClosed (O : MultibodyAdmittedObject) : Prop :=
  O.conclusion

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean