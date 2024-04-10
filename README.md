# Random binary alloys

## Lattice parameters and cohesive energies

Run the simulation with files `lmp_nonequal.in` and `CrMoNbTaVW_Xu2022.eam.alloy`. The second file can be found in [another GitHub repository](https://github.com/shuozhixu/CMS_2022).

Using one core would be sufficient. Should take no more than a few seconds.

Once the simulation is finished, we will find a new file `a_E`. The first column is the ratio of the trial lattice parameter to 3.3, the second column is the trial lattice parameter itself, in units of Anstrong, the thrid column is the cohesive energy, in units of eV. If we plot a curve with the second column as the _x_ axis and the third column as the _y_ axis, the curve should look like the ones in Figure 1(a) of the last paper in the reference list.

Then run `sh min.sh` to find out the trial lattice parameter corresponding to the lowest cohesive energy (i.e., the minimum on that curve), and that would be the actual lattice parameter. Specifically, we will see
	
	0.957 3.15810000000007 -6.9142343824172

which are for the binary Mo<sub>0.9</sub>Nb<sub>0.1</sub>.

Then do the calculation in Mo<sub>1-_x_</sub>Nb<sub>_x_</sub>, where _x_ varies from 0.2 to 0.9, in increments of 0.1. For each _x_, change the second-to-last number of line 23 of `lmp_nonequal.in` to the corresponding Nb concentration. For example, change that line to

	set type 1 type/ratio 2 0.7 12

for the binary Mo<sub>0.3</sub>Nb<sub>0.7</sub>.

Once the combination of Mo and Nb is done, run the calculations for the following six binaries

- Mo<sub>1-_x_</sub>Ta<sub>_x_</sub>
- Nb<sub>1-_x_</sub>Ta<sub>_x_</sub>
- Mo<sub>1-_x_</sub>V<sub>_x_</sub>
- Nb<sub>1-_x_</sub>V<sub>_x_</sub>
- Ta<sub>1-_x_</sub>V<sub>_x_</sub>
- V<sub>1-_x_</sub>W<sub>_x_</sub>

where _x_ varies from 0.1 to 0.9, in increments of 0.1.

When running these simulations, remember to change the last two elements of line 27 of the file `lmp_nonequal.in` to `Mo Ta`, `Nb Ta`, `Mo V`, `Nb V`, `Ta V`, or `V W`.

Note: Unless we run a new simulation in a new directory, we need to remove the old file `a_E` in the same directory before running the new simulation. Otherwise, new data will be appended to the old `a_E` file, which is NOT what we want.

In total, we will run calculations in 63 random binaries, including 7 equal-molar ones and 56 non-equal-molar ones.

### Equal-molar binaries

Data for the seven equal-molar binaries can also be calculated using the special quasi-random structures. For that, run the simulation with files `lmp_equal.in`, `data.equal-binary`, and `CrMoNbTaVW_Xu2022.eam.alloy`. Using one core would be sufficient. Should take no more than a few seconds.

Follow the aforementioned steps and record the three numbers:

	0.924 3.04920000000009 -5.96926166742226

on the screen.

Then change the last two elements of line 16 of the `lmp_equal.in` file to `Mo Cr`. Repeat the steps above. Record the result as well.

Next, calculate the mean and standard deviation of the lattice parameter and cohesive energy between the two sets of data, i.e., four numbers in total for the binary CrMo. Record these numbers and compare the mean values with those calculated earlier using a different model. 

Once the binary containing Cr and Mo is done, change the last two elements of line 16 of the `lmp_equal.in` file to any other binary combination among Cr, Mo, Nb, Ta, V, and W. There should be 28 more such combinations. Record all results and calculate the mean and standard deviation for all remaining 14 alloys.

## Elastic constants

Each simulation requires files `in.elastic`, `displace.mod`, `init_nonequal.mod`, `potential.mod`, and `CrMoNbTaVW_Xu2022.eam.alloy`.

Make one change in the file `potential.mod`:

- Change the last two elements of line 6 to `Mo Nb`

Run the simulation. Using one core would be sufficient. Should take no more than a few minutes.

Once it is finished, go to the end of the file `lmp.out`. We will find values of `C11all`, `C12all` etc. Use Equations 10-12 of the last paper in the reference list to calculate the three effective BCC elastic constants, in units of GPa. These are for the binary Mo<sub>0.9</sub>Nb<sub>0.1</sub>.

Then, for the binary Mo<sub>0.8</sub>Nb<sub>0.2</sub>, make two changes in the file `init_nonequal.mod`:

- Change the last number (by default 0.957) of line 55 to the correct ratio identified in the prior lattice parameter calculation, i.e., the first of the three numbers we recorded for Mo<sub>0.8</sub>Nb<sub>0.2</sub>;
- Change the second-to-last number (by default 0.1) of line 53 to 0.2.

Repeat the steps above to calculate all Mo<sub>1-_x_</sub>Nb<sub>_x_</sub>, where _x_ varies from 0.3 to 0.9.

Once the combination of Mo and Nb is done, run the calculations for the remaining six binaries. Remember to change the last two elements of line 6 of the file `potential.mod` to `Mo Ta`, `Nb Ta`, `Mo V`, `Nb V`, `Ta V`, or `V W`.

### Equal-molar binaries

Run the simulation with files `in.elastic`, `displace.mod`, `init_equal.mod`, `potential.mod`, `data.equal-binary`, and `CrMoNbTaVW_Xu2022.eam.alloy`. Using one core would be sufficient. Should take no more than a few seconds.

Once the simulation is finished, follow the aforementioned steps to calculate the three effective BCC elastic constants, in units of GPa.

Then, take the following two steps for `Mo Cr`:

- Change the last number (by default 0.924) of line 50 of the file `init_equal.mod` to the correct ratio identified in the prior lattice parameter calculation, i.e., the first of the three numbers we recorded for `Mo Cr`;
- Change the last two elements of line 6 of the file `potential.mod` to `Mo Cr`.

Again, calculate the mean and standard deviation of the three elastic constants between the two sets of data, i.e., six numbers in total. Record these numbers.

Next, run simulations for the other 28 binary combination, i.e., other 14 alloys.

## Reference

Data obtained through the above calculations, as well as those by [Xu et al.](http://dx.doi.org/10.1016/j.commatsci.2021.110942) and [Mamun et al.](http://dx.doi.org/10.1088/1402-4896/acf533), have been used to train [a machine learning model](https://github.com/caruizto/mvgpr_as).

If you use any files from this GitHub repository, please cite

- Cesar Ruiz, Anshu Raj, Shuozhi Xu, [Multivariate Gaussian process surrogates for predicting basic structural parameter of refractory non-dilute random alloys](https://doi.org/10.1063/5.0186045), APL Mach. Learn. 2 (2024) 026107
