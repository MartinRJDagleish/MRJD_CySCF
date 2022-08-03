class molecule:
    def __init__(self, natom, charge, z_vals, geom, point_group):
        self.natom = natom
        self.charge = charge
        self.z_vals = z_vals
        self.geom = geom
        self.point_group = point_group

    def print_geom(self):
        #* after loading the input file, print the geometry
        #* pass string with coordinates to the print function
        for i in range(self.natom):
            print(f"{self.z_vals[i]} {self.geom[i][0]:8.5f} {self.geom[i][1]:8.5f} {self.geom[i][2]:8.5f}")

    def rotate(self,phi):
        #TODO rotate geometry function
        return 0
    
    def translate(self,x,y,z):
        for i in range(self.natom):
            self.geom[i][0] += x
            self.geom[i][1] += y
            self.geom[i][2] += z

    def bound(self,atom1,atom2):
        #TODO bound geometry function
        return 0

    def angle(self,atom1,atom2,atom3):
        #TODO angle geometry function
        return 0

    def dihedral(self,atom1,atom2,atom3,atom4):
        #TODO dihedral geometry function
        return 0

def main():
    #* define molecule object
    water = molecule(3,0,[1,6,1],[[0,0,0],[0,0,1.5],[0,1.5,0]],"C2v")
    water.print_geom()
    water.translate(1,0,0)
    water.print_geom()

    
if __name__ == "__main__":
    import numpy as np 
    main()
    