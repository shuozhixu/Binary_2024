# Binaries

## Lattice parameters and cohesive energies

Run the simulation with files `lmp.in`, `data.binary`, and `CrMoNbTaVW_Zhou04.eam.alloy`. Using one core would be sufficient. Should take no more than 1 min.

Once the simulation is finished, you should find a new file `a_E`. The first column is the ratio of the trial lattice parameter to 3.3, the second column is the actual trial lattice parameter, in units of A, the thrid column is the cohesive energy.

Then run `sh min.sh` to find out the trial lattice parameter for the lowest cohesive energy, and that would be the actual lattice parameter. Specifically, you will see

	0.924 3.04920000000009 -5.96926166742226

on the screen. Record these three numbers.

Then modify the last two elements of line 16 of the `lmp.in` file to `Mo Cr`. Repeat the steps above. Record the result as well.

Then modify the last two elements of line 16 of the `lmp.in` file to any other binary combination among Cr, Mo, Nb, Ta, V, and W. There should be 28 more such combinations. Record all results

## Elastic constants

I will add more here once you finish all simulations above