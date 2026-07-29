import DynamicsMultibodySystemsTheoremCanonicalLaneLean.DynamicsMultibodyBridgeLemmas

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

def gateClosed (A : AdmittedClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmittedClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse