import test as t


def main():
    my_var = t.Shrubbery(10,5)
    my_var.describe()  
    print(my_var.height)
    print(my_var.width) 

if __name__ == "__main__":
    main()