[x, fx] = easyDataset();

[w, b, ww, bb]= generateSearchSpace(-10,10,21);

l = loss(x,fx,ww,bb);

plotFunctionAndLoss(x,fx,ww,bb,l);

pause();

mesh(ww,bb,l);

xlabel('w')
ylabel('b')
zlabel('loss(w,b)')


wCurrent = 10.0;
bCurrent = 10.0;
lCurrent = loss(x,fx,wCurrent,bCurrent); 

hold-on;

plot3(wCurrent,bCurrent,lCurrent,'o-r*');

pause();

a=wCurrent;
b=bCurrent;
c=lCurrent;


while (true)
[dw, db] = gradient(x,fx,wCurrent,bCurrent);

wCurrent = wCurrent - 0.01 *  dw
bCurrent = bCurrent - 0.01 *  db 
lCurrent = loss(x,fx,wCurrent,bCurrent); 
a = [a wCurrent];
b = [b bCurrent];
c = [c lCurrent];

plot3(a,b,c,'o-r*');
pause()
endwhile




