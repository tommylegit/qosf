OPENQASM 3.0;
include "qelib1.inc";
qubit q[3];
qubit a[2];
qubit b[2];
bit c[3];
bit syn[2];
gate syndrome d1,d2,d3,a1,a2
{
x d1;
cx d1,a1; 
cx d2,a1;
cx d2,a2; 
cx d3,a2;
}
gate blop o1,o2
{
cx o1,o2;
}
gate ping s1,s2,s3
{
ccx s3,s2,s1;
}
x q[0]; // error
barrier q;
syndrome q[0],q[1],q[2],a[0],a[1];
x q[1];
blop b[1],b[0];
ping q[0],q[1],q[2];
ping q[0],a[0],b[0];
measure a -> syn;
if(syn==1) x q[0];
if(syn==2) x q[2];
if(syn==3) x q[1];
measure q -> c;