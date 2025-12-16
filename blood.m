tic; % Start timer.
clc; % Clear command window.
clearvars; % Get rid of variables from prior run of this m-file.
fprintf('Running BlobsDemo.m...\n'); % Message sent to command window.
workspace; % Make sure the workspace panel with all the variables is showing.
imtool close all;  % Close all imtool figures.
format long g;
format compact;
captionFontSize = 14;

% Check that user has the Image Processing Toolbox installed.
hasIPT = license('test', 'image_toolbox');
if ~hasIPT
	% User does not have the toolbox installed.
	message = sprintf('Sorry, but you do not seem to have the Image Processing Toolbox.\nDo you want to try to continue anyway?');
	reply = questdlg(message, 'Toolbox missing', 'Yes', 'No', 'Yes');
	if strcmpi(reply, 'No')
		% User said No, so exit.
		return;
	end
end

% Read image
baseFileName = 'bloodsmear.jpg';
folder = fileparts(which(baseFileName));
fullFileName = fullfile(folder, baseFileName);
fprintf('Full File Name = "%s".\n', fullFileName);
if ~exist(fullFileName, 'file')
	% It doesn't exist in the current folder.
	% Look on the search path.
	if ~exist(baseFileName, 'file')
		% It doesn't exist on the search path either.
		% Alert user that we can't find the image.
		warningMessage = sprintf('Error: the input image file\n%s\nwas not found.\nClick OK to exit the demo.', fullFileName);
		uiwait(warndlg(warningMessage));
		fprintf(1, 'Finished running BlobsDemo.m.\n');
		return;
	end
	% Found it on the search path.  Construct the file name.
	fullFileName = baseFileName; % Note: don't prepend the folder.
end

% If we get here, we should have found the image file.
originalImage = imread(fullFileName);
% Check to make sure that it is grayscale, just in case the user substituted their own image.
[rows, columns, numberOfColorChannels] = size(originalImage);
if numberOfColorChannels > 1
	promptMessage = sprintf('Your image file has %d color channels.\nThis demo was designed for grayscale images.\nDo you want me to convert it to grayscale for you so you can continue?', numberOfColorChannels);
	button = questdlg(promptMessage, 'Continue', 'Convert and Continue', 'Cancel', 'Convert and Continue');
	if strcmp(button, 'Cancel')
		fprintf(1, 'Finished running BlobsDemo.m.\n');
		return;
	end
	% Do the conversion using standard book formula
	originalImage = rgb2gray(originalImage);
    
end

% Display the grayscale image.
subplot(3, 4, 1);
imshow(originalImage);

% Maximize the figure window.
hFig1 = gcf;
hFig1.Units = 'normalized';
hFig1.WindowState = 'maximized'; % Go to full screen.
hFig1.NumberTitle = 'off'; % Get rid of "Figure 1"
hFig1.Name = 'By Simge K.'; % Put this into title bar.

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Original blood image showing RBCs');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio.

% let's get its histogram and display it.
[pixelCount, grayLevels] = imhist(originalImage);
subplot(3, 4, 2);
bar(pixelCount);
title('Histogram of original image', 'FontSize', captionFontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
grid on;

% Increase the contrast of the originalImage using imadjust()
contrastImage = imadjust(originalImage);

% Display the grayscale contrast image.
subplot(3, 4, 3);
imshow(contrastImage);

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Contrast version of the image');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio

% Let's get its histogram and display it.
[pixelCount, grayLevels] = imhist(contrastImage);
subplot(3, 4, 4);
bar(pixelCount);
title('Histogram of contrast image', 'FontSize', captionFontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
grid on;


% Apply Gauss Filter
gaussed_img = imgaussfilt(contrastImage, 2);

subplot(3,4,5);
imshow(gaussed_img), title('Gaussla Filtrelenmiş Contrast Görüntü');

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Gauss version of the image');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio

% Let's get its histogram and display it.
[pixelCount, grayLevels] = imhist(gaussed_img);
subplot(3, 4, 6);
bar(pixelCount);
title('Histogram of gaussed image', 'FontSize', captionFontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
grid on;

% Gamma adjusting operation
gamma_img = imadjust(contrastImage, [], [], 1.5);

subplot(3,4,7);
imshow(gamma_img), title('Gamma Düzeltmesi ile İyileştirilmiş Contrast Görüntü');

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Gamma version of the image');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio

% Let's get its histogram and display it.
[pixelCount, grayLevels] = imhist(gamma_img);
subplot(3, 4, 8);
bar(pixelCount);
title('Histogram of gamma image', 'FontSize', captionFontSize);
xlim([0 grayLevels(end)]); % Scale x axis manually.
grid on;


% Defining manual threshold value
thresholdValue = 95; %95 grayscale value

% Manual thresholding on gamma-corrected image
final_img = gamma_img > thresholdValue;

subplot(3,4,9);
imshow(final_img), title(['cgamthres, Eşik Değeri: ', num2str(thresholdValue)]);

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Gama & Thresholded ');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio


%%%

% Remove noise
cleanImg = bwareaopen(final_img, 20); % Clear 20 pixel objects.

% Display the grayscale clean image.
subplot(3,4,10);
imshow(cleanImg);

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Cleaned version of the image');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio

% Code Like a Girl.
subplot(3, 4, 12);
imshow('Ada.png');

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
%axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio


% Apply Median filter
medImage = medfilt2(cleanImg, [2 2]); % 2x2 boyutunda pencere
subplot(3,4,11);
imshow(medImage);

% Force it to display RIGHT NOW (otherwise it might not display until it's all done, unless you've stopped at a breakpoint.)
drawnow;
caption = sprintf('Medianed');
title(caption, 'FontSize', captionFontSize);
axis('on', 'image'); % Make sure image is not artificially stretched because of screen's aspect ratio


% Detect circle
[centers, radii] = imfindcircles(medImage, [20 50], 'ObjectPolarity', 'dark');

% Visualize detected circles

imshow(medImage);
viscircles(centers, radii, 'EdgeColor', 'r');
title('Daire Algılama (imfindcircles)');


% Count the number of detected circles
numCircles = size(centers, 1);

% Visualize the results
figure;
imshow(medImage);
hold on;
viscircles(centers, radii, 'EdgeColor', 'r'); % Draw circles in red
hold off;

% Display the circle count in the title
title(['Total RBC: ', num2str(numCircles)]);








 



















