import sys

import data_reader
import numpy as np

from data_provider import DataProvider

if __name__ == '__main__':
    data = DataProvider({"data:length": np.array([1,2]), "data:width": np.array([4,5])})

    data_reader.data_reader.read_value(data.get_size, data.get_value)
    print("\n*** OK ***")
