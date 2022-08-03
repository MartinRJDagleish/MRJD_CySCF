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

# cdef class molecule:
class molecule:
    cdef int natom, charge
    cdef np.ndarray geom, z_vals 
    cdef str point_group

    def __init__(self, natom, charge, z_vals, geom, point_group):
        self.natom = natom
        self.charge = charge
        self.z_vals = z_vals
        self.geom = geom
        self.point_group = point_group

    def print_geom(self):
        # * after loading the input file, print the geometry
        # * pass string with coordinates to the print function
        cdef int i 
        for i in range(self.natom):
            print(
                f"{self.z_vals[i]} {self.geom[i][0]:8.5f} {self.geom[i][1]:8.5f} {self.geom[i][2]:8.5f}"
            )
        print("")  # * print empty line to separate output

    def rotate(self, phi):
        # TODO rotate geometry function
        return 0

    cdef double x, y, z 
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


atom_dict = {
        1: "H",    2: "He",
        3: "Li",   4: "Be",  5: "B",   6: "C",   7: "N",   8: "O",   9: "F",   10: "Ne",
        11: "Na", 12: "Mg", 13: "Al", 14: "Si", 15: "P",  16: "S",  17: "Cl",  18: "Ar",
        19: "K",  20: "Ca", 
            21: "Sc", 22: "Ti", 23: "V",  24: "Cr", 25: "Mn",  26: "Fe", 27: "Co", 28: "Ni", 29: "Cu", 30: "Zn", 
                            31: "Ga", 32: "Ge", 33: "As", 34: "Se", 35: "Br",  36: "Kr",
        37: "Rb", 38: "Sr", 
            39: "Y",  40: "Zr", 41: "Nb", 42: "Mo", 43: "Tc",  44: "Ru", 45: "Rh", 46: "Pd", 47: "Ag", 48: "Cd",
                            49: "In", 50: "Sn", 51: "Sb", 52: "Te", 53: "I",   54: "Xe",
        55: "Cs", 56: "Ba",
            57: "La", 58: "Ce", 59: "Pr", 60: "Nd", 61: "Pm", 62: "Sm", 63: "Eu", 64: "Gd", 65: "Tb", 66: "Dy", 67: "Ho", 68: "Er", 69: "Tm", 70: "Yb", 71: "Lu",
            72: "Hf", 73: "Ta", 74: "W",  75: "Re", 76: "Os", 77: "Ir", 78: "Pt", 79: "Au", 80: "Hg",
                            81: "Tl", 82: "Pb", 83: "Bi", 84: "Po", 85: "At", 86: "Rn",
        87: "Fr", 88: "Ra",
            89: "Ac", 90: "Th", 91: "Pa", 92: "U",  93: "Np", 94: "Pu", 95: "Am", 96: "Cm", 97: "Bk", 98: "Cf", 99: "Es", 100: "Fm", 101: "Md", 102: "No", 103: "Lr",
            104: "Rf", 105: "Db", 106: "Sg", 107: "Bh", 108: "Hs", 109: "Mt", 110: "Ds", 111: "Rg", 112: "Cn", 113: "Nh", 114: "Fl", 115: "Mc", 116: "Lv", 117: "Ts", 118: "Og"
    }
reverse_atom_dict = {v: k for k, v in atom_dict.items()}

def convert_symbols_to_zvals(symbol):
    return reverse_atom_dict[symbol]

def convert_zvals_to_symbols(z_vals):
    # * convert z_vals to symbols
    return [atom_dict[z_val] for z_val in z_vals]
    # cdef str symbol
    # cdef list symbols = []
    # for z_val in z_vals:
    #     symbol = atom_dict.get(z_val)
    #     symbols.append(symbol)
    # return symbols

if __name__ == "__main__":
    import numpy as np

    # main()
