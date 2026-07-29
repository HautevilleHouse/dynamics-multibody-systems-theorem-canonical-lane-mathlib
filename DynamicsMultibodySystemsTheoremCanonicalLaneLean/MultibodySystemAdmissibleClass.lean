import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure MultibodySystemAdmittedObject where
  system : Type
  topology : TopologicalSpace system
  configurationManifold : Prop
  lagrangianDefined : Prop
  dynamicsEquation : Prop
  conclusion : dynamicsEquation

structure MultibodySystemAdmissibleClass where
  object : MultibodySystemAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def MultibodySystemWitnessClosed (O : MultibodySystemAdmittedObject) : Prop :=
  O.dynamicsEquation

def admittedClosure (A : MultibodySystemAdmissibleClass) : Prop :=
  MultibodySystemWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse