# Random binary alloys

## Lattice parameters and cohesive energies

Run the simulation with files `lmp_lat.in`, `data.binary`, and `CrMoNbTaVW_Xu2022.eam.alloy`. Using one core would be sufficient. Should take no more than a few seconds.

Once the simulation is finished, you will find a new file `a_E`. The first column is the ratio of the trial lattice parameter to 3.3, the second column is the trial lattice parameter itself, in units of Anstrong, the thrid column is the cohesive energy, in units of eV. If you plot a curve with the second column as the _x_ axis and the third column as the _y_ axis, the curve should look like the ones in Figure 1(a) of the paper in the reference list.

Then run `sh min.sh` to find out the trial lattice parameter corresponding to the lowest cohesive energy (i.e., the minimum on that curve), and that would be the actual lattice parameter. Specifically, you will see

	0.924 3.04920000000009 -5.96926166742226

on the screen. Record these three numbers.

Then change the last two elements of line 16 of the `lmp_lat.in` file to `Mo Cr`. Repeat the steps above. Record the result as well.

Next, calculate the mean and standard deviation of the lattice parameter and cohesive energy between the two sets of data, i.e., four numbers in total for the binary CrMo. Record these numbers.

Once the binary containing Cr and Mo is done, change the last two elements of line 16 of the `lmp_lat.in` file to any other binary combination among Cr, Mo, Nb, Ta, V, and W. There should be 28 more such combinations. Record all results and calculate the mean and standard deviation for all remaining 14 alloys.

Note: Unless you run a new simulation in a new directory, you need to remove the old file `a_E` in the same directory before running the new simulation. Otherwise, new data will be appended to the old `a_E` file, which is NOT what we want.

## Elastic constants

Run the simulation with files `in.elastic`, `displace.mod`, `init.mod`, `potential.mod`, `data.binary`, and `CrMoNbTaVW_Xu2022.eam.alloy`. Using one core would be sufficient. Should take no more than a few seconds.

Once the simulation is finished, go to the end of the file `lmp.out`. You will find values of `C11all`, `C12all` etc. Use Equations 10-12 of the paper in the reference list to calculate the three effective BCC elastic constants, in units of GPa. Specifically, they should be

	383.218 119.581 53.754

Record these numbers.

Then, take the following two steps for `Mo Cr`:

- Change the last number (by default 0.924) of line 50 of the file `init.mod` to the correct ratio identified in the prior lattice parameter calculation, i.e., the first of the three numbers you recorded for `Mo Cr`;
- Change the last two elements of line 16 of the file `potential.mod` to `Mo Cr`.

Again, calculate the mean and standard deviation of the three elastic constants between the two sets of data, i.e., six numbers in total. Record these numbers.

Next, run simulations for the other 28 binary combination, i.e., other 14 alloys.

Record all mean and standard deviation values into an Excel file, in a format similar to Tables 2 and 3 of the paper in the reference list. Note that there is no standard deviation in those two tables, but you should record it for this project.

Calculate values in the second-to-last column using

_A_<sub>c</sub> = 2 _C_<sub>44</sub> / (_C_<sub>11</sub>-_C_<sub>12</sub>)

Calculate values in the last column using Equation 9 of the paper in the reference list.

Note: in the Excel file, only one line for one alloy, e.g., only one line for CrMo, instead of `Cr Mo` and `Mo Cr` separately, because you already calculated the mean and standard deviation.

## References

If you use any files from this GitHub repository, please cite

- Shuozhi Xu, Saeed Zare Chavoshi, Yanqing Su, [On calculations of basic structural parameters in multi-principal element alloys using small atomistic models](http://dx.doi.org/10.1016/j.commatsci.2021.110942), Comput. Mater. Sci. 202 (2022) 110942