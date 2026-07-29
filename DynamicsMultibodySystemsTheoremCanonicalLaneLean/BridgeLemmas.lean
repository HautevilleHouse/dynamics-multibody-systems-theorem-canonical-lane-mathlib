import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

def bridgeClosed (A : MultibodySystemAdmissibleClass) : Prop :=
  MultibodySystemWitnessClosed A.object

theorem bridge_from_admissible_class (A : MultibodySystemAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : MultibodySystemAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MultibodySystemAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse