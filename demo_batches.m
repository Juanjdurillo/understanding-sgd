[x, fx] = easyDataset();
[w, b, ww, bb]= generateSearchSpace(-10,10,21);
l = loss(x,fx,ww,bb);
[odd_x, even_x, odd_fx, even_fx] = separateOddEven(x,fx);

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
wCurrentLRood = 10.0;
bCurrentLRood = 10.0;
lCurrentLRood  = loss(x,fx,wCurrentLRood,bCurrentLRood); 

wCurrentLReven = 10.0;
bCurrentLReven = 10.0;
lCurrentLReven  = loss(x,fx,wCurrentLReven,bCurrentLReven); 

subplot(1,2,1);
plot3(wCurrentLRood,bCurrentLRood,lCurrentLRood,'o-r*');

subplot(1,2,2);
plot3(wCurrentLReven,bCurrentLReven,lCurrentLReven,'o-r*');


pause();

allWLRood=wCurrentLRood;
allBLRood=bCurrentLRood;
allLLRood=lCurrentLRood;

allWLReven=wCurrentLReven;
allBLReven=bCurrentLReven;
allLLReven=lCurrentLReven;


while (true)
[dw, db]   = gradient(odd_x,odd_fx,wCurrentLRood,bCurrentLRood);
[ddw, ddb] = gradient(even_x,even_fx,wCurrentLReven,bCurrentLReven);


wCurrentLRood = wCurrentLRood - 0.01 *  dw
bCurrentLRood = bCurrentLRood - 0.01 *  db 
lCurrentLRood = loss(x,fx,wCurrentLRood,bCurrentLRood); 


wCurrentLReven = wCurrentLReven - 0.01 *  ddw
bCurrentLReven = bCurrentLReven - 0.01 *  ddb 
lCurrentLReven = loss(x,fx,wCurrentLReven,bCurrentLReven); 


allWLRood=[allWLRood wCurrentLRood];
allBLRood=[allBLRood bCurrentLRood];
allLLRood=[allLLRood lCurrentLRood];

allWLReven=[allWLReven wCurrentLReven];
allBLReven=[allBLReven bCurrentLReven];
allLLReven=[allLLReven lCurrentLReven];

subplot(1,2,1);
plot3(allWLRood,allBLRood,allLLRood,'o-r*');
subplot(1,2,2);
plot3(allWLReven,allBLReven,allLLReven,'o-r*');
pause()
endwhile




