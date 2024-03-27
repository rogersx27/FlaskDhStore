import json


def extract_values_from_json(json_data: str, keys: list) -> tuple:
    """
    Extracts the values from a JSON string based on the keys provided.
    :param json_data: str
    :param keys: list of keys we want to use to extract the values from the JSON
    :return: tuple
    """
    try:
        user_data = json.loads(json_data)

        values = []

        # Iterate over the keys and get the values from the JSON
        for key in keys:
            value = user_data[0].get(key)
            values.append(value)

        return tuple(values)
    except Exception as e:
        raise e
