histx = linspace(0,18,19);

figure()
[hist266,X266] = hist(output_266_14.KER(output_266_14.KER<18),histx);
[hist1300,X1300] = hist(output_1300_14.KER(output_1300_14.KER<18),histx);
[hist800,X800] = hist(output_800_14.KER(output_800_14.KER<18),histx);
plot(X266,hist266/sum(hist266),'-o',X800,hist800/sum(hist800),'-o',X1300,hist1300/sum(hist1300),'-o')
legend(['266, mean eV ' num2str(mean(output_266_14.KER(output_266_14.KER<18)))],...
    ['800, mean eV ' num2str(mean(output_800_14.KER(output_800_14.KER<18)))],...
    ['1300, mean eV ' num2str(mean(output_1300_14.KER(output_1300_14.KER<18)))])
title('CH2/C')

[VinKE_1300,Vin_1300] = hist(bootstrp(1000,'mean', output_1300_14.KER(output_1300_14.KER<18)));
[VinKE_800,Vin_800] = hist(bootstrp(1000,'mean', output_800_14.KER(output_800_14.KER<18)));
[VinKE_266,Vin_266] = hist(bootstrp(1000,'mean', output_266_14.KER(output_266_14.KER<18)));
figure();plot(Vin_266, VinKE_266, '-o', Vin_800, VinKE_800, '-o', Vin_1300, VinKE_1300, '-o')
legend('266, mean eV ', '800, mean eV ', '1300, mean eV ')
title('CH2/C bootstrap')

figure()
[hist266,X266] = hist(output_266_1.KER(output_266_1.KER<18),histx);
[hist1300,X1300] = hist(output_1300_1.KER(output_1300_1.KER<18),histx);
[hist800,X800] = hist(output_800_1.KER(output_800_1.KER<18),histx);
plot(X266,hist266/sum(hist266),'-o',X800,hist800/sum(hist800),'-o',X1300,hist1300/sum(hist1300), '-o')
legend(['266, mean eV ' num2str(mean(output_266_1.KER(output_266_1.KER<18)))],...
    ['800, mean eV ' num2str(mean(output_800_1.KER(output_800_1.KER<18)))],...
    ['1300, mean eV ' num2str(mean(output_1300_1.KER(output_1300_1.KER<18)))])
title('C2H/H')

[DPKE_1300,DP_1300] = hist(bootstrp(1000,'mean', output_1300_1.KER(output_1300_1.KER<18)));
[DPKE_800,DP_800] = hist(bootstrp(1000,'mean', output_800_1.KER(output_800_1.KER<18)));
[DPKE_266,DP_266] = hist(bootstrp(1000,'mean', output_266_1.KER(output_266_1.KER<18)));
figure();plot(DP_266, DPKE_266, '-o', DP_800, DPKE_800, '-o', DP_1300, DPKE_1300, '-o')
legend('266, mean eV ', '800, mean eV ', '1300, mean eV ')
title('C2H/C bootstrap')

figure()
[hist266,X266] = hist(output_266_13.KER(output_266_13.KER<18),histx);
[hist1300,X1300] = hist(output_1300_13.KER(output_1300_13.KER<18),histx);
[hist800,X800] = hist(output_800_13.KER(output_800_13.KER<18),histx);
plot(X266,hist266/sum(hist266),'-o',X800,hist800/sum(hist800),'-o',X1300,hist1300/sum(hist1300), '-o')
legend(['266, mean eV ' num2str(mean(output_266_13.KER(output_266_13.KER<18)))],...
    ['800, mean eV ' num2str(mean(output_800_13.KER(output_800_13.KER<18)))],...
    ['1300, mean eV ' num2str(mean(output_1300_13.KER(output_1300_13.KER<18)))])
title('CH/CH')

[AcKE_1300,Ac_1300] = hist(bootstrp(1000,'mean', output_1300_13.KER(output_1300_13.KER<18)));
[AcKE_800,Ac_800] = hist(bootstrp(1000,'mean', output_800_13.KER(output_800_13.KER<18)));
[AcKE_266,Ac_266] = hist(bootstrp(1000,'mean', output_266_13.KER(output_266_13.KER<18)));
figure();plot(Ac_266, AcKE_266, '-o', Ac_800, AcKE_800, '-o', Ac_1300, AcKE_1300, '-o')
legend('266, mean eV ', '800, mean eV ', '1300, mean eV ')
title('CH/CH bootstrap')