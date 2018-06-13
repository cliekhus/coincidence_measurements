function f = momentumPlotsFunctions()
    f.momHists = @momHists;
    f.momProject = @momProject;
    f.particleKERhist = @particleKERhist;
    f.momentum2dDistCartesian = @momentum2dDistCartesian;
    f.momentum2dDistPolar = @momentum2dDistPolar;
end


function [] = momHists(output)
    subplot(1,3,1) 
    hist(sum(real(output.momXOut),2), 50)
    xlabel('momx')
    subplot(1,3,2)
    hist(sum(real(output.momYOut),2), 50)
    xlabel('momy')
    subplot(1,3,3)
    hist(sum(real(output.momZOut),2), 50)
    xlabel('momz')
end



function[] = particleKERhist(particle, partEnergyOut, mass, nbins, KEmax, openorclosed)
    hist(partEnergyOut(:,particle), nbins)
    xlim([0, KEmax])
    title(['KER(M/Z=' num2str(mass(particle)) '), ' openorclosed])
    xlabel('KER (eV)')
    ylabel('counts')
end

function[X, Y, N] = momentum2dDistCartesian ...
            (parallel_proj, perpendicular_proj, nbins, plotname, name1, name2, name3)

    [N,C] = hist3([real(parallel_proj), real(perpendicular_proj)], [nbins, nbins]);
    N = N';
    
    Xp = C{1}(1:(length(C{1}) - 1)) + diff(C{1})/2 ;
    Xm = C{1}(1:(length(C{1}) - 1)) - diff(C{1})/2 ;
    
    Yp = C{2}(1:(length(C{2}) - 1)) + diff(C{2})/2 ;
    Ym = C{2}(1:(length(C{2}) - 1)) - diff(C{2})/2 ;
    
    X = [Xm(1), (Xm(2:length(Xm)) + Xp(1:(length(Xp) - 1)))/2, Xp(length(Xp))];
    Y = [Ym(1), (Ym(2:length(Xm)) + Yp(1:(length(Xp) - 1)))/2, Yp(length(Yp))];
    pcolor(X, Y, N);
    
    title(plotname)
    xlabel(['$$ \vec{P}(' name1 ')\parallel \left(\vec{P}(' name3 ') - \vec{P}(' name2 ')\right) $$'], 'Interpreter','latex')
    ylabel(['$$ \vec{P}(' name1 ')\perp  \left(\vec{P}('    name3 ') - \vec{P}(' name2 ')\right) $$'], 'Interpreter','latex')


end

function[Xp, Yp, Noutp, rs] = momentum2dDistPolar ...
            (parallel_proj, perpendicular_proj, rdata, adata, plotname, name1, name2, name3)

[Xp, Yp, Noutp, rs] = hist3polar (real(parallel_proj), real(perpendicular_proj), rdata, adata);
                
pl = pcolor(Xp, Yp, Noutp);
set(pl, 'EdgeColor', 'none');
pl;
axis equal tight

title(plotname)
xlabel(['$$ \vec{P}(' name1 ')\parallel \left(\vec{P}(' name3 ') - \vec{P}(' name2 ')\right) $$'], 'Interpreter','latex')
ylabel(['$$ \vec{P}(' name1 ')\perp  \left(\vec{P}('    name3 ') - \vec{P}(' name2 ')\right) $$'], 'Interpreter','latex')

end
