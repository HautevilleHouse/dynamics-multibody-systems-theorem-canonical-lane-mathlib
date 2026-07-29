import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

def ConstrainedDynamicsClosure (A : MultibodySystemAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamics_endgame (A : MultibodySystemAdmissibleClass) :
    ConstrainedDynamicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicsMultibodySystemsTheoremCanonicalLaneLean
end HautevilleHouse