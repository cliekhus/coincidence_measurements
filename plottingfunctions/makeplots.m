clear all
close all

f = momentumPlotsFunctions();

%put in data info
folder = 'G:\2018_05_03\analysis\';
filename = 'acetelene_1ps_6p3n10torr_0p6nd';
delay = '2000';
intensity = 'low';

shutterMarkers = [string('_closed_'), string('_open_')];
shutterTitle = [string('control off'), string('control on')];

delayMarkers = [string('_p'), string('_n')];
delayTitle = [string(['+' delay ' fs']), string(['-' delay ' fs'])];

%move to center of mass frame
momsumlimit = 2;

[plotting_data] = ...
    getmomentum(folder, filename, intensity, delay, momsumlimit, shutterMarkers, delayMarkers);

%update the energy
plotting_data = resetEV(plotting_data);

%project the hydrogen momentum onto the CH+ and C+ ions
plotting_data = anglesAndProjections(plotting_data);

%make polar plots
numMom = 10;
maxMom = 8;
numAngle = 5;

plotting_data = polarPlots(plotting_data, numMom, maxMom, numAngle, shutterTitle, delayTitle, intensity);
plotting_data = polarPlotsNormalized(plotting_data, numMom, maxMom, numAngle, shutterTitle, delayTitle, intensity);

compareShutterAngle(plotting_data, delayMarkers, shutterMarkers, delayTitle, shutterTitle, numAngle, intensity)
compareShutterLowAnulus(plotting_data, delayMarkers, shutterMarkers, delayTitle, shutterTitle, numAngle, numMom, maxMom, intensity)
compareShutterHighAnulus(plotting_data, delayMarkers, shutterMarkers, delayTitle, shutterTitle, numAngle, numMom, maxMom, intensity)