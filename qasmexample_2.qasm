OPENQASM 3.0;
include "qelib1.inc";
qubit q[3];
qubit a[2];
qubit b[2];
bit c[3];
bit syn[2];
gate blop w1,w2
{
cx w1,w2; 
}
x q[0]; // error
barrier q;
syndrome q[0],q[1],q[2],a[0],a[1];
blop b[0],b[1];
measure a -> syn;
if(syn==1) x q[0];
if(syn==2) x q[2];
if(syn==3) x q[1];
measure q -> c;