from collections import UserDict


class DataProvider(UserDict):

    def get_value(self, identifier):
        return self[identifier]
