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

    print(water.natom) # here is the problem -> AttributeError: 'molecule' object has no attribute 'natom'
    # * define water as molecule object
    

    # symbols = cyscf.convert_zvals_to_symbols(water.z_vals)
    # print(symbols)

if __name__ == "__main__":
    main()