import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure MultibodyAdmittedObject where
  configurationSpace : Type
  topology : TopologicalSpace configurationSpace
  dynamicsSatisfied : Prop
  constraintsClosed : Prop
  conclusion : constraintsClosed -> dynamicsSatisfied

structure AdmittedClass where
  object : MultibodyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmittedClass) : Prop :=
  MultibodyWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse