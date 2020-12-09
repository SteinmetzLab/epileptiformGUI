

function epileptiformGUI(U, V, t, mimg)

hands = struct(); 

hands.f = figure; 
set(hands.f, 'Position', [1000         420        1412         918]);

hands.axIm = subplot(1,2,1); 
hands.mimg = imagesc(mimg); 
axis image; axis off; colormap gray;
hold on;
% set(hands.mimg, 'HitTest', 'off'); 

myData.maxW = 0.5; myData.minP = 0.2;

myData.U = U; 
myData.V = V; 
myData.t = t;
myData.mimg = mimg;
myData.hands = hands;
myData.pts = []; % the points that have been clicked

set(hands.f, 'UserData', myData);

set(hands.mimg, 'ButtonDownFcn', @mimgClickCallback);



function mimgClickCallback(s, e)
fprintf(1, 'mimg click\n');
f = get(get(s, 'Parent'), 'Parent');
myData = get(f, 'UserData');
ptIdx = size(myData.pts,1)+1;
px = round(e.IntersectionPoint(1));
py = round(e.IntersectionPoint(2));

plot(myData.hands.axIm, px, py, 'ro'); 

tr = squeeze(myData.U(py,px,:))'*myData.V; % note that px, py are "backwards" in this indexing
mean(tr); %ought to be zero
tr = tr./myData.mimg(py,px); % to df/f

myData.hands.ptTr(ptIdx) = subplot(3,4,3+(ptIdx-1)*4);
% plot(myData.t, tr); .
findpeaks(tr, myData.t,'MinPeakProminence',0.02,'Annotate','extents');
xlim(myData.t(round(numel(tr)/2))+[-10 10])
xlabel('Time (s)'); ylabel('Signal (df/f)'); 
legend off

if ptIdx>1; linkaxes(myData.hands.ptTr, 'x'); end

[pks,locs,widths,proms] = findpeaks(tr, myData.t,'MinPeakProminence',0.02,'Annotate','extents');

badEvs = widths'<myData.maxW & proms>myData.minP;

myData.hands.ptWP(ptIdx) = subplot(3,4,4+(ptIdx-1)*4);
plot(widths, proms, '.'); 
hold on; 
if sum(badEvs)>0
    plot(widths(badEvs), proms(badEvs), 'r.'); 
end
xlim([0 1]); ylim([0 1]); 
xlabel('Peak Width (s)'); ylabel('Peak Prominence (df/f)'); 
title(sprintf('Event rate = %.2f ev/s', sum(badEvs)/max(myData.t))); 

myData.pts(ptIdx,1) = px;
myData.pts(ptIdx,2) = py;
set(f, 'UserData', myData);