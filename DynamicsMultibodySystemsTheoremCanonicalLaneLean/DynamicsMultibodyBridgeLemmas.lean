import DynamicsMultibodySystemsTheoremCanonicalLaneLean.DynamicsMultibodyAdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

def bridgeClosed (A : AdmittedClass) : Prop :=
  MultibodyWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmittedClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse