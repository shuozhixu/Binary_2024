# Binaries

## Lattice parameters and cohesive energies

Run the simulation with files `lmp_lat.in`, `data.binary`, and `CrMoNbTaVW_Zhou04.eam.alloy`. Using one core would be sufficient. Should take no more than 1 min.

Once the simulation is finished, you should find a new file `a_E`. The first column is the ratio of the trial lattice parameter to 3.3, the second column is the actual trial lattice parameter, in units of A, the thrid column is the cohesive energy, in units of eV. If you plot a curve with the second column as the _x_ axis and the third column as the _y_ axis, the curve should look like the ones in Figure 1(a) of the paper in the reference list.

Then run `sh min.sh` to find out the trial lattice parameter for the lowest cohesive energy (i.e., the minimum on that curve), and that would be the actual lattice parameter. Specifically, you will see

	0.924 3.04920000000009 -5.96926166742226

on the screen. Record these three numbers.

Then modify the last two elements of line 16 of the `lmp_lat.in` file to `Mo Cr`. Repeat the steps above. Record the result as well.

Next, calculate the mean and standard deviation of the lattice parameter and cohesive energy between the two sets of data, i.e., four numbers in total. Record these numbers.

Once the binary containing `Cr` and `Mo` is done, modify the last two elements of line 16 of the `lmp_lat.in` file to any other binary combination among Cr, Mo, Nb, Ta, V, and W. There should be 28 more such combinations. Record all results.

Note: Unless you run a new simulation in a new directory, you need to remove the old file `a_E` in the same directory before running the new simulation. Otherwise, new data will be appended to the old `a_E` file, which is not what we want.

## Elastic constants

Run the simulation with files `in.elastic`, `displace.mod`, `init.mod`, `potential.mod`, `data.binary`, and `CrMoNbTaVW_Zhou04.eam.alloy`. Using one core would be sufficient. Should take no more than 1 min.

Once the simulation is finished, go to the end of the file `lmp.out`. You will find values of `C11all`, `C12all` etc. Use Equations 10-12 of the paper in the reference list to calculate the three effective BCC elastic constants. Specifically, they should be

	383.218 119.581 53.754

Record these numbers.

Then, take the following two steps for `Mo Cr`:

- Modify the last number (by default 0.924) of line 50 of the file `in.elastic` to the correct ratio identified the lattice parameter calculation, i.e., the first number you recorded for `Mo Cr`;
- Modify the last two elements of line 16 of the `potential.mod` file to `Mo Cr`.

Again, calculate the mean and standard deviation of the three elastic constants between the two sets of data, i.e., six numbers in total. Record these numbers.

Next, run simulations for the other 28 binary combination.

Record all mean and standard deviation values into an Excel file, using this format:

 | a0 | Ecoh | C11 | C12 | C44 |

CrMo | | | | | |

CrMo | | | | | |

.. | | | | | |

## References

If you use any files from this GitHub repository, please cite

- Shuozhi Xu, Saeed Zare Chavoshi, Yanqing Su, [On calculations of basic structural parameters in multi-principal element alloys using small atomistic models](http://dx.doi.org/10.1016/j.commatsci.2021.110942), Comput. Mater. Sci. 202 (2022) 110942