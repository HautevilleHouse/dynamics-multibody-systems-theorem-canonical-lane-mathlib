import DynamicsMultibodySystemsTheoremCanonicalLaneLean.DynamicsMultibodyGateLemmas

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

def ConstrainedMultibodyClosure (A : AdmittedClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_multibody_endgame (A : AdmittedClass) :
    ConstrainedMultibodyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse