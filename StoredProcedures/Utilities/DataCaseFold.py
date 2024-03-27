from typing import Any


def data_case_fold(data: Any) -> tuple[str | Any, ...]:
    """
        Converts the data to lower case.
        :param data: Any
        :return: tuple[str | Any, ...]
    """
    if isinstance(data, str):
        return (data.casefold(),)

    fold_data = tuple(index.casefold() if isinstance(index, str) else index for index in data)
    return fold_data
