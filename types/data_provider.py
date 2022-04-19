from collections import UserDict


class DataProvider(UserDict):

    def get_value(self, identifier) -> float:
        return self[identifier]
