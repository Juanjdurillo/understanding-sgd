[x, fx] = easyDataset();
[w, b, ww, bb]= generateSearchSpace(-10,10,21);
l = loss(x,fx,ww,bb);

subplot(1,2,1);
mesh(ww,bb,l);
xlabel('w')
ylabel('b')
zlabel('loss(w,b)')
hold-on 


subplot(1,2,2);
mesh(ww,bb,l); 
xlabel('w')
ylabel('b')
zlabel('loss(w,b)')
hold-on 

pause()
wCurrentLRsmall = 10.0;
bCurrentLRsmall = 10.0;
lCurrentLRsmall  = loss(x,fx,wCurrentLRsmall,bCurrentLRsmall); 

wCurrentLRlarge = 10.0;
bCurrentLRlarge = 10.0;
lCurrentLRlarge  = loss(x,fx,wCurrentLRlarge,bCurrentLRlarge); 

subplot(1,2,1);
plot3(wCurrentLRsmall,bCurrentLRsmall,lCurrentLRsmall,'o-r*');

subplot(1,2,2);
plot3(wCurrentLRlarge,bCurrentLRlarge,lCurrentLRlarge,'o-r*');


pause();

allWLRsmall=wCurrentLRsmall;
allBLRsmall=bCurrentLRsmall;
allLLRsmall=lCurrentLRsmall;

allWLRlarge=wCurrentLRlarge;
allBLRlarge=bCurrentLRlarge;
allLLRlarge=lCurrentLRlarge;


while (true)
[dw, db]   = gradient(x,fx,wCurrentLRsmall,bCurrentLRsmall);
[ddw, ddb] = gradient(x,fx,wCurrentLRlarge,bCurrentLRlarge);


wCurrentLRsmall = wCurrentLRsmall - 0.01 *  dw
bCurrentLRsmall = bCurrentLRsmall - 0.01 *  db 
lCurrentLRsmall = loss(x,fx,wCurrentLRsmall,bCurrentLRsmall); 


wCurrentLRlarge = wCurrentLRlarge - 0.05 *  ddw
bCurrentLRlarge = bCurrentLRlarge - 0.05 *  ddb 
lCurrentLRlarge = loss(x,fx,wCurrentLRlarge,bCurrentLRlarge); 


allWLRsmall=[allWLRsmall wCurrentLRsmall];
allBLRsmall=[allBLRsmall bCurrentLRsmall];
allLLRsmall=[allLLRsmall lCurrentLRsmall];

allWLRlarge=[allWLRlarge wCurrentLRlarge];
allBLRlarge=[allBLRlarge bCurrentLRlarge];
allLLRlarge=[allLLRlarge lCurrentLRlarge];

subplot(1,2,1);
plot3(allWLRsmall,allBLRsmall,allLLRsmall,'o-r*');
subplot(1,2,2);
plot3(allWLRlarge,allBLRlarge,allLLRlarge,'o-r*');
pause()
endwhile




