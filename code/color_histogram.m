function hist = color_histogram(xMin, yMin, xMax, yMax, frame, hist_bin)

% Split into RGB channels
r = frame(yMin:yMax, xMin:xMax, 1);
g = frame(yMin:yMax, xMin:xMax, 2);
b = frame(yMin:yMax, xMin:xMax, 3);

% Get hist values for each channel
rHist = imhist(r, hist_bin);
gHist = imhist(g, hist_bin);
bHist = imhist(b, hist_bin);

% Concatenate all histograms
hist = [rHist; gHist; bHist]'; % size:(1, hist_bin*3)
hist = hist / sum(hist);
end