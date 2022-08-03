# cython: language_level=3
# tag: numpy
# You can ignore the previous line.
# It's for internal testing of the cython documentation.

import numpy as np

# "cimport" is used to import special compile-time information
# about the numpy module (this is stored in a file numpy.pxd which is
# currently part of the Cython distribution).
cimport numpy as np

# It's necessary to call "import_array" if you use any part of the
# numpy PyArray_* API. From Cython 3, accessing attributes like
# ".shape" on a typed Numpy array use this API. Therefore we recommend
# always calling "import_array" whenever you "cimport numpy"
np.import_array()

# We now need to fix a datatype for our arrays. I've used the variable
# DTYPE for this, which is assigned to the usual NumPy runtime
# type info object.
DTYPE = np.int

# "ctypedef" assigns a corresponding compile-time type to DTYPE_t. For
# every type in the numpy module there's a corresponding compile-time
# type with a _t-suffix.
ctypedef np.int_t DTYPE_t

# "def" can type its arguments but not have a return type. The type of the
# arguments for a "def" function is checked at run-time when entering the
# function.
#
# The arrays f, g and h is typed as "np.ndarray" instances. The only effect
# this has is to a) insert checks that the function arguments really are
# NumPy arrays, and b) make some attribute access like f.shape[0] much
# more efficient. (In this example this doesn't matter though.)

class molecule:
    def __init__(self, natom, charge, z_vals, geom, point_group):
        cdef int self.natom = natom
        cdef int self.charge = charge
        cdef int self.z_vals = z_vals
        cdef np.ndarray self.geom = geom
        cdef str self.point_group = point_group

    def print_geom(self):
        # * after loading the input file, print the geometry
        # * pass string with coordinates to the print function
        for i in range(self.natom):
            print(
                f"{self.z_vals[i]} {self.geom[i][0]:8.5f} {self.geom[i][1]:8.5f} {self.geom[i][2]:8.5f}"
            )
        print("")  # * print empty line to separate output

    def rotate(self, phi):
        # TODO rotate geometry function
        return 0

    def translate(self, x, y, z):
        for i in range(self.natom):
            self.geom[i][0] += x
            self.geom[i][1] += y
            self.geom[i][2] += z

    def bound(self, atom1, atom2):
        # TODO bound geometry function
        return 0

    def angle(self, atom1, atom2, atom3):
        # TODO angle geometry function
        return 0

    def dihedral(self, atom1, atom2, atom3, atom4):
        # TODO dihedral geometry function
        return 0


if __name__ == "__main__":
    import numpy as np

    # main()
