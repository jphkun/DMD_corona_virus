clc
clear all
close all

% Extracting last column of each data*.m into A
for i=1:44
    string = "data"+i+".mat";
    A_struct = load(string');
    A(:,i) = A_struct.vec(:,3);
end

% Computing SVD
[U, S, V] = svd(A, 'econ');

% Plotting First Mode Shape

for i=1:44
    figure('units','normalized','outerposition',[0 0 1 1])
    hold on
    [X, Y] = meshgrid(-180:1:180, -90:1:90);
    contour(X,Y,reshape(U(:,i),[181,361]),100);
    colormap('jet');
    I = imread("Equirectangular_projection_SW.jpg");
    h = image(xlim,-ylim,I);
    uistack(h,"bottom");
    title("Mode: "+i+ "  Singular Value: " + S(i,i));
    caxis([-1 0.2]);
    colormap('jet');
    colorbar;
    hold off
end
