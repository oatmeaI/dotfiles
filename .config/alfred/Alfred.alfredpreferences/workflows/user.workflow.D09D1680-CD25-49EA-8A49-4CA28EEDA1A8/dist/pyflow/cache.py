import os

import requests


class Cache:
    def __init__(self, cachedir: str):
        if not os.path.exists(cachedir):
            os.makedirs(cachedir)

        self.cachedir = cachedir

    def download_image(self, url: str, filename: str = None) -> str:
        filename: str = filename if filename else url.split("/")[-1]
        path: str = f"{self.cachedir}/{filename}"

        if os.path.isfile(path):
            return path

        with open(path, "wb") as f:
            f.write(requests.get(url).content)

        return path
