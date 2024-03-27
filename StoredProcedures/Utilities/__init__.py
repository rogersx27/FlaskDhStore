"""
This module contains utility functions that are used by other modules in the StoredProcedures package.

Functions:
    * data_case_fold: Converts the data to lower case.
    * generate_token: Generates a token based on the data provided.
    * extract_values_from_json: (get_json_data) Extracts the values from a JSON object.
"""

from .DataCaseFold import data_case_fold as flatten_data
from .ExtractValuesFromJson import extract_values_from_json as get_json_data
from .Token import generate_token
