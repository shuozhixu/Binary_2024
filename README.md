# Binaries

## Lattice parameters and cohesive energies

Run the simulation with files `lmp.in`, `data.binary`, and `CrMoNbTaVW_Zhou04.eam.alloy`. Using one core would be sufficient. Should take no more than 1 min.

Once the simulation is finished, you should find a new file `a_E`. The first column is the ratio of the trial lattice parameter to 3.3, the second column is the actual trial lattice parameter, in units of A, the thrid column is the cohesive energy, in units of eV. If you plot a curve with the second column as the _x_ axis and the third column as the _y_ axis, the curve should look like the ones in Figure 1(a) of [this paper](http://dx.doi.org/10.1016/j.commatsci.2021.110942).

Then run `sh min.sh` to find out the trial lattice parameter for the lowest cohesive energy (i.e., the minimum on that curve), and that would be the actual lattice parameter. Specifically, you will see

	0.924 3.04920000000009 -5.96926166742226

on the screen. Record these three numbers.

Then modify the last two elements of line 16 of the `lmp.in` file to `Mo Cr`. Repeat the steps above. Record the result as well.

Then modify the last two elements of line 16 of the `lmp.in` file to any other binary combination among Cr, Mo, Nb, Ta, V, and W. There should be 28 more such combinations. Record all results.

Note: Unless you run a new simulation in a new directory, you need to remove the old file `a_E` in the same directory before running the new simulation. Otherwise, new data will be appended to the old `a_E` file, which is not what we want.

## Elastic constants

I will add more here once you finish all simulations above