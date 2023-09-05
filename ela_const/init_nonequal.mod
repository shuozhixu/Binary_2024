# NOTE: This script can be modified for different atomic structures, 
# units, etc. See in.elastic for more info.
#

# Define the finite deformation size. Try several values of this
# variable to verify that results do not depend on it.
variable up equal 1.0e-6
 
# Define the amount of random jiggle for atoms
# This prevents atoms from staying on saddle points
variable atomjiggle equal 1.0e-5

# Uncomment one of these blocks, depending on what units
# you are using in LAMMPS and for output

# metal units, elastic constants in eV/A^3
#units		metal
#variable cfac equal 6.2414e-7
#variable cunits string eV/A^3

# metal units, elastic constants in GPa
units		metal
variable cfac equal 1.0e-4
variable cunits string GPa

# real units, elastic constants in GPa
#units		real
#variable cfac equal 1.01325e-4
#variable cunits string GPa

# Define minimization parameters
variable etol equal 0.0 
variable ftol equal 1.0e-10
variable maxiter equal 100
variable maxeval equal 1000
variable dmax equal 1.0e-2

# generate the box and atom positions using a diamond lattice

boundary	p p p

variable        xlen equal 10
variable        ylen equal 10
variable        zlen equal 10

lattice         bcc 3.3 orient x 1 0 0 orient y 0 1 0 orient z 0 0 1
region          box block -${xlen} ${xlen} -${ylen} ${ylen} -${zlen} ${zlen}

create_box      2 box

create_atoms    1 region box

set type 1 type/ratio 2 0.1 12

variable r equal 0.957

change_box all x scale $r y scale $r z scale $r remap

change_box	all triclinic

# Need to set mass to something, just to satisfy LAMMPS
mass 1 1
mass 2 1
