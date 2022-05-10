[x, fx] = easyDataset();
[w, b, ww, bb]= generateSearchSpace(-10,10,21);

l = loss(x,fx,ww,bb);
[odd_x, even_x, odd_fx, even_fx] = separateOddEven(x,fx);
odd_l = loss(odd_x,odd_fx,ww,bb);
even_l = loss(even_x,even_fx, ww,bb);



subplot(2,2,1)
mesh(ww,bb,l);

xlabel('w')
ylabel('b')
zlabel('loss(w,b)')
subplot(2,2,2)
mesh(ww,bb,odd_l)
xlabel('w')
ylabel('b')
zlabel('loss-batch1(w,b)')
subplot(2,2,3)
mesh(ww,bb,even_l)
xlabel('w')
ylabel('b')
zlabel('loss-batch2(w,b)')
subplot(2,2,4)
xlabel('w')
ylabel('b')
zlabel('loss(w,b)')
mesh(ww,bb,l);
hold-on;
mesh(ww,bb,odd_l);
mesh(ww,bb,even_l);
xlabel('w')
ylabel('b')
zlabel('all-loss(w,b)')


pause()

