import Std.Diagnostics.DumpMachine;
import Microsoft.Quantum.*;
    operation Main(): (Result, Result) {
        use (q1, q2) = (Qubit(), Qubit());
        H(q1);
        CNOT(q1,q2); //entangle q1 and q2 making q2 dependent on q1
        DumpMachine();
        let (m1, m2) = (M(q1), M(q2));// measuring the qubits nd store the results i m1 nd m2

        Reset(q1);
        Reset(q2);
        return (m1,m2);
    }
import Microsoft.Quantum.Intrinsic.*;
import Microsoft.Quantum.Canon.*;

operation SetQubitState(desired : Result, target : Qubit) : Unit {
    if desired != M(target) {
        X(target);
    }
}