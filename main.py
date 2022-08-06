import numpy as np

import src.cyscf_classes as cyscf


def main():
    # * define water as molecule object
    water_geom = np.array(
        [
            [0, 0, -0.122368916506],
            [0, 1.414995841403, 0.971041753535],
            [0, -1.414995841403, 0.971041753535],
        ]
    )
    water = cyscf.molecule(3, 0, np.array([8, 1, 1]), water_geom, "C2v")

    water.print_geom()
    water.translate(5, 0, 0)
    water.print_geom()

    # print(water.natom) # here is the problem -> AttributeError: 'molecule' object has no attribute 'natom'
    # * define water as molecule object
    
    # symbols = cyscf.convert_zvals_to_symbols(water.z_vals)
    # print(symbols)

    # * Test convert_zvals_to_symbols function
    # z_vals = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -1]
    # atom_symbols = ['H', 'He', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne', "CC"]
    # symbols = []
    # z_vals_from_symbols = []
    # for z in z_vals:
    #     symbols.append(cyscf.convert_zvals_to_symbols(z))
    # print(symbols)

    # for symbol in symbols:
    #     z_vals_from_symbols.append(cyscf.convert_symbols_to_zvals(symbol))
    # print(z_vals_from_symbols)

if __name__ == "__main__":
    main()
    class test:
        def __init__(self,a,b,c):
            self.a = a
            self.b = b
            self.c = c
        
    my_obj = test(1,2,3)
    print(my_obj.a)
    print(my_obj.b)
    print(my_obj.c) 