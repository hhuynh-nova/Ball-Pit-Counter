%% ECE 2409-001
%% Fall 2019
%% Final Exam Project
%% Hoa Huynh, Lauren Dietzler, Noah Kramer

Published=datestr(now, 21)
clc;clear;close all
%% Part 1 Loading
balls=imread('ballpit(1).jpg');
figure(1)
imshow(balls)
title('Ball Pit')
%% Part 1 Red
red=balls(560:587,588:622,:);

rr=red(:,:,1);
gr=red(:,:,2);
br=red(:,:,3);

figure(2)
histogram(rr,'facecolor','r','binwidth',5)
hold on
histogram(gr,'facecolor','g','binwidth',5)
histogram(br,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Red Ball Histogram')
ylim([0 250])

%% Part 1 Yellow
yellow=balls(635:660,560:590,:);

ry=yellow(:,:,1);
gy=yellow(:,:,2);
by=yellow(:,:,3);

figure(3)
histogram(ry,'facecolor','r','binwidth',5)
hold on
histogram(gy,'facecolor','g','binwidth',5)
histogram(by,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Yellow Ball Histogram')
ylim([0 400])
%% Part 1 Green
green=balls(639:666,323:348,:);

rg=green(:,:,1);
gg=green(:,:,2);
bg=green(:,:,3);

figure(5)
histogram(rg,'facecolor','r','binwidth',5)
hold on
histogram(gg,'facecolor','g','binwidth',5)
histogram(bg,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Green Ball Histogram')
ylim([0 300])

%% Part 1 Blue
blue=balls(565:590,540:575,:);

rb=blue(:,:,1);
gb=blue(:,:,2);
bb=blue(:,:,3);

figure(4)
histogram(rb,'facecolor','r','binwidth',5)
hold on
histogram(gb,'facecolor','g','binwidth',5)
histogram(bb,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Blue Ball Histogram')
ylim([0 350])

%% Part 1 Purple
purple=balls(485:505,450:480,:);

rpurp=purple(:,:,1);
gpurp=purple(:,:,2);
bpurp=purple(:,:,3);

figure(6)
histogram(rpurp,'facecolor','r','binwidth',5)
hold on
histogram(gpurp,'facecolor','g','binwidth',5)
histogram(bpurp,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Purple Ball Histogram')
ylim([0 150])

%% Part 1 Pink
pink=balls(540:565,400:420,:);

rpink=pink(:,:,1);
gpink=pink(:,:,2);
bpink=pink(:,:,3);

figure(7)
histogram(rpink,'facecolor','r','binwidth',5)
hold on
histogram(gpink,'facecolor','g','binwidth',5)
histogram(bpink,'facecolor','b','binwidth',5)

set(gca,'FontSize',12)
grid on
title('Pink Ball Histogram')
ylim([0 200])

%% Test Pulling Red
redtest=balls(560:587,588:622,:);
back=255+ones(760,1140,3);
back(560:587,588:622,:)=redtest;

%% Test Pulling Yellow
yelltest=balls(635:660,560:590,:);
back=255+ones(760,1140,3);
back(635:660,560:590,:)=yelltest;
%% Test Pulling Green
greentest=balls(639:666,323:348,:);
back=255+ones(760,1140,3);
back(639:666,323:348,:)=greentest;

%% Test Pulling Blue
bluetest=balls(565:590,540:575,:);
back=255+ones(760,1140,3);
back(565:590,540:575,:)=bluetest;

%% Test Pulling Purple
purpletest=balls(485:505,450:480,:);
back=255+ones(760,1140,3);
back(485:505,450:480,:)=purpletest;

%% Test Pulling Pink
pinktest=balls(540:565,400:420,:);
back=255+ones(760,1140,3);
back(540:565,400:420,:)=pinktest;

%% Final Test Pulling
figure(8)
subplot(1,6,1),imshow(redtest)
subplot(1,6,2),imshow(yelltest)
subplot(1,6,3),imshow(greentest)
subplot(1,6,4),imshow(bluetest)
subplot(1,6,5),imshow(purpletest)
subplot(1,6,6),imshow(pinktest)

%% Part 2 Segmenting Red
rlr=balls(:,:,1);
glr=balls(:,:,2);
blr=balls(:,:,3);

kred=[rlr>blr&rlr>glr&glr>blr&glr<80];
redpixels=sum(kred(:));

kkr=~kred;

rlr(kkr)=0;
glr(kkr)=0;
blr(kkr)=0;

leavered=cat(3,rlr,glr,blr);

radius=15;
area=pi*radius*radius;

redballs=redpixels/area;
redcount=197;
redpercent=(redballs/redcount)*100;

figure(14)
imshow(leavered)
title(['Segmenting Red Balls (Code: ' num2str(floor(redballs)) '   Count: ' num2str(redcount) '   Percent: ' num2str(round(redpercent,2)) '%)'])
xlabel('(R>B & R>G & G>B & G<80)')

%% Part 2 Segmenting Yellow
rly=balls(:,:,1);
gly=balls(:,:,2);
bly=balls(:,:,3);

kyell=[gly-bly>rly-gly&gly<rly&bly<60];
yellowpixels=sum(kyell(:));

kkyell=~kyell;

rly(kkyell)=0;
gly(kkyell)=0;
bly(kkyell)=0;

leaveyellow=cat(3,rly,gly,bly);

radius=15;
area=pi*radius*radius;

yellowballs=yellowpixels/area;
yellowcount=174;
yellowpercent=(yellowballs/yellowcount)*100;

figure(15)
imshow(leaveyellow)
title(['Segmenting Yellow Balls (Code: ' num2str(floor(yellowballs)) '   Count: ' num2str(yellowcount) '   Percent: ' num2str(round(redpercent,2)) '%)'])
xlabel('(G-B>R-G & G<R & B<60)')
%% Part 2 Segmenting Green
rlg=balls(:,:,1);
glg=balls(:,:,2);
blg=balls(:,:,3);

kg=[glg>rlg&glg>blg&blg+rlg<115];
greenpixels=sum(kg(:));

kkg=~kg;

rlg(kkg)=0;
glg(kkg)=0;
blg(kkg)=0;

leavegreen=cat(3,rlg,glg,blg);

radius=15;
area=pi*radius*radius;

greenballs=greenpixels/area;
greencount=35;
greenpercent=(greenballs/greencount)*100;

figure(17)
imshow(leavegreen)
title(['Segmenting Green Balls (Code: ' num2str(floor(greenballs)) '   Count: ' num2str(greencount) '   Percent: ' num2str(round(redpercent,2)) '%)'])
xlabel('(G>R & G>B & B+R<115)')

%% Part 2 Segmenting Blue
rlb=balls(:,:,1);
glb=balls(:,:,2);
blb=balls(:,:,3);

kblue=[blb-rlb>glb&blb>rlb&glb>rlb&glb>60];
bluepixels=sum(kblue(:));

kkblue=~kblue;

rlb(kkblue)=0;
glb(kkblue)=0;
blb(kkblue)=0;

leaveblue=cat(3,rlb,glb,blb);

radius=15;
area=pi*radius*radius;

blueballs=bluepixels/area;
bluecount=167;
bluepercent=(blueballs/bluecount)*100;

figure(16)
imshow(leaveblue)
title(['Segmenting Blue Balls (Code: ' num2str(floor(blueballs)) '   Count: ' num2str(bluecount) '   Percent: ' num2str(round(redpercent,2)) '%)'])
xlabel('(B-R>G & B>R & G>R & G>60)')

%% Part 2 Segmenting Purple
rlpurp=balls(:,:,1);
glpurp=balls(:,:,2);
blpurp=balls(:,:,3);

kpurp=[blpurp>rlpurp&rlpurp>glpurp&blpurp+rlpurp-glpurp>150];
purplepixels=sum(kpurp(:));

kkpurp=~kpurp;

rlpurp(kkpurp)=0;
glpurp(kkpurp)=0;
blpurp(kkpurp)=0;

leavepurple=cat(3,rlpurp,glpurp,blpurp);

radius=15;
area=pi*radius*radius;

purpleballs=purplepixels/area;
purplecount=64;
purplepercent=(purpleballs/purplecount)*100;

figure(18)
imshow(leavepurple)
title(['Segmenting Purple Balls (Code: ' num2str(floor(purpleballs)) '   Count: ' num2str(purplecount) '   Percent: ' num2str(round(redpercent,2)) '%)'])
xlabel('(B>R & R>G & B+R-G>150)')
%% Part 2 Segmenting Pink
rlpink=balls(:,:,1);
glpink=balls(:,:,2);
blpink=balls(:,:,3);

kpink=[rlpink>blpink&blpink>glpink&blpink>120];
pinkpixels=sum(kpink(:));

kkpink=~kpink;

rlpink(kkpink)=0;
glpink(kkpink)=0;
blpink(kkpink)=0;

leavepink=cat(3,rlpink,glpink,blpink);

radius=15;
area=pi*radius*radius;

pinkballs=pinkpixels/area;
pinkcount=124;
pinkpercent=(pinkballs/pinkcount)*100;

figure(19)
imshow(leavepink)
title(['Segmenting Pink Balls (Code: ' num2str(floor(pinkballs)) '   Count: ' num2str(pinkcount) '   Percent: ' num2str(round(pinkpercent,2)) '%)'])
xlabel('(R>B & B>G & B>120)')
%% Part 3
radius=15;
area=pi*radius*radius;

redballs=redpixels/area;
yellowballs=yellowpixels/area;
greenballs=greenpixels/area;
blueballs=bluepixels/area;
purpleballs=purplepixels/area;
pinkballs=pinkpixels/area;

redcount=197;
yellowcount=174;
greencount=35;
bluecount=167;
purplecount=64;
pinkcount=124;

redpercent=(redballs/redcount)*100;
yellowpercent=(yellowballs/yellowcount)*100;
greenpercent=(greenballs/greencount)*100;
bluepercent=(blueballs/bluecount)*100;
purplepercent=(purpleballs/purplecount)*100;
pinkpercent=(pinkballs/pinkcount)*100;


fprintf('Color     Code Estimate     Actual Count   Percent(Estimate/Actual)\n')
fprintf('-------------------------------------------------------------------\n')
fprintf('Red            %2.0f               %2.0f                %4.2f\n',redballs,redcount,redpercent)
fprintf('Yellow         %2.0f               %2.0f                %4.2f\n',yellowballs,yellowcount,yellowpercent)
fprintf('Green           %2.0f                %2.0f                %4.2f\n',greenballs,greencount,greenpercent)
fprintf('Blue           %2.0f               %2.0f                %4.2f\n',blueballs,bluecount,bluepercent)
fprintf('Purple          %2.0f                %2.0f               %4.2f\n',purpleballs,purplecount,purplepercent)
fprintf('Pink           %2.0f               %2.0f                %4.2f\n',pinkballs,pinkcount,pinkpercent)
