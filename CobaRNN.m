clear all;
clc;
W1=[1 3;4 6];
W2=[1 5;7 4];
W3=[4 3;2 2];
W4=[1 1;3 2];
W5=[4 1;0 1];
W6=[2 1;1 0];
W7=[1 0;0 2];
W8=[2 0;0 3];
W9=[0 1;1 0];
W10=[0 1;2 0];
W11=[0 1;1 1];
W12=[3 0;1 2];
tau2=[1 2;0 1];
tau3=[1 2;1 0];
tau4=[1 -1;0 1];
tau5=[1 2;1 -1];
U1=tau2*W1;
U2=tau3*W2;
U3=tau4*W3*inv(tau2);
U4=tau5*W4*inv(tau2);
U5=tau4*W5*inv(tau3);
U6=tau5*W6*inv(tau3);
U7=tau2*W7*inv(tau4);
U8=tau3*W8*inv(tau4);
U9=tau2*W9*inv(tau5);
U10=tau3*W10*inv(tau5);
U11=W11*inv(tau4);
U12=W12*inv(tau5);
f=@(x) x.^2;
x=[2;1];
for i=1:3
    if i==1
        yWA=f(W1*x);
        yWB=f(W2*x);
        tempWA=f(W3*yWA+W5*yWB);
        tempWB=f(W4*yWA+W6*yWB);
        yWA=W11*tempWA;
        yWB=W12*tempWB;
        yW=yWA+yWB;
    else
        yWA=f(W1*x+W7*tempWA+W9*tempWB);
        yWB=f(W2*x+W8*tempWA+W10*tempWB);
        tempWA=f(W3*yWA+W5*yWB);
        tempWB=f(W4*yWA+W6*yWB);
        yWA=W11*tempWA;
        yWB=W12*tempWB;
        yW=yWA+yWB;
    end;
    yW
    if i==1
        yUA=tau2*f(inv(tau2)*U1*x);
        yUB=tau3*f(inv(tau3)*U2*x);
        tempUA=tau4*f(inv(tau4)*(U3*yUA+U5*yUB));
        tempUB=tau5*f(inv(tau5)*(U4*yUA+U6*yUB));
        yUA=U11*tempUA;
        yUB=U12*tempUB;
        yU=yUA+yUB;
    else
        yUA=tau2*f(inv(tau2)*(U1*x+U7*tempUA+U9*tempUB));
        yUB=tau3*f(inv(tau3)*(U2*x+U8*tempUA+U10*tempUB));
        tempUA=tau4*f(inv(tau4)*(U3*yUA+U5*yUB));
        tempUB=tau5*f(inv(tau5)*(U4*yUA+U6*yUB));
        yUA=U11*tempUA;
        yUB=U12*tempUB;
        yU=yUA+yUB;
    end;
    yU
end;