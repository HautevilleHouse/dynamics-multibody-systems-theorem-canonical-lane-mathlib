import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicsMultibodySystemsTheoremCanonicalLaneLean

structure NewtonEulerAlgorithmPackage where
  bodyList : Type u
  jointList : Type v
  forwardRecursion : Prop
  backwardRecursion : Prop
  forcePropagation : Prop
  accelerationResolution : Prop

structure NewtonEulerAlgorithmEvidence (N : NewtonEulerAlgorithmPackage) where
  forwardRecursionClosed : N.forwardRecursion
  backwardRecursionClosed : N.backwardRecursion
  forcePropagationClosed : N.forcePropagation
  accelerationResolutionClosed : N.accelerationResolution

def NewtonEulerAlgorithmClosed (N : NewtonEulerAlgorithmPackage) : Prop :=
  N.forwardRecursion ∧ N.backwardRecursion ∧
  N.forcePropagation ∧ N.accelerationResolution

theorem newton_euler_algorithm_closed_from_evidence (N : NewtonEulerAlgorithmPackage)
    (E : NewtonEulerAlgorithmEvidence N) : NewtonEulerAlgorithmClosed N := by
  exact And.intro E.forwardRecursionClosed
    (And.intro E.backwardRecursionClosed
      (And.intro E.forcePropagationClosed E.accelerationResolutionClosed))

end HautevilleHouse.DynamicsMultibodySystemsTheoremCanonicalLaneLean