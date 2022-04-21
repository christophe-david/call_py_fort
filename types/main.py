import sys
import numpy as np
import demo
from data_provider import DataProvider

if __name__ == '__main__':
    data = DataProvider({"data:array_data": np.array([1.0, 2.0]), "data:scalar_data": 10.0})

    demo.data_reader.get_structure(data.get_value)
    demo.demo.main()
    print("\n*** OK ***")
