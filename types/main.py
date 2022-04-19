import sys

import demo
from data_provider import DataProvider

if __name__ == '__main__':
    data = DataProvider({"data:length": float(sys.argv[1]), "data:width": float(sys.argv[2])})

    demo.data_reader.get_rectangle(data.get_value)
    demo.demo.main()
    print("\n*** OK ***")
