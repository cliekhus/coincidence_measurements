function compareDelayLowAnulus(plotting_data, delayMarkers, shutterMarkers, delayTitle, shutterTitle, numAngle, numMom, maxMom, intensity)

for nn = 1:length(plotting_data)
    for mm = nn+1:length(plotting_data)
        
        if plotting_data(nn).shutter == plotting_data(mm).shutter
            
            polarDist = plotting_data(nn).polarDist;
            polarDist(:,end) = [];
            
            figure
            errorbar(linspace(0,pi,numAngle), sum(polarDist(1:round(3/maxMom*numMom-1),...
                1:(numAngle)), 1), sqrt(sum(polarDist(1:round(3/maxMom*numMom-1), 1:(numAngle)), 1)) )
            hold on
            
            polarDist = plotting_data(mm).polarDist;
            polarDist(:,end) = [];
            
            errorbar(linspace(0,pi,numAngle), sum(polarDist(1:round(3/maxMom*numMom-1),...
                1:(numAngle)), 1), sqrt(sum(polarDist(1:round(3/maxMom*numMom-1), 1:(numAngle)), 1)) )
            
            title(['Integrated from |p| = 0 to |p| = ' num2str(plotting_data(nn).rs(round(3/maxMom*numMom))) ', '...
                char(shutterTitle(strcmp(plotting_data(nn).shutter,shutterMarkers))) ', intensity ' intensity])
            xlabel('Angle (rad)')
            ylabel('counts')
            legend(char(delayTitle(strcmp(plotting_data(nn).delay,delayMarkers))),...
                char(delayTitle(strcmp(plotting_data(mm).delay,delayMarkers))),'Location','southeast')
            grid on
        
        end
    end
end
