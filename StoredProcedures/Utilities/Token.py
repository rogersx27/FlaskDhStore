import secrets


def generate_token(length: int = 32) -> str:
    """
        Generates a new token for the user.
        :param length: int (default 32)
        :return: str
    """
    return secrets.token_urlsafe(length)  # 32 bytes long token
