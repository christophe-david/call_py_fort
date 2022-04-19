import sys

import demo
from data_provider import DataProvider

if __name__ == '__main__':
    data = DataProvider({"data:length": sys.argv[1], "data:width": sys.argv[2]})

    demo.demo.main(data.get_value)
    print("\n*** OK ***")
