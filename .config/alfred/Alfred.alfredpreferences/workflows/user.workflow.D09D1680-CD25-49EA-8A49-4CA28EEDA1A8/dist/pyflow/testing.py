import os
import subprocess
import sys
from unittest import TestCase
from unittest.mock import patch

from pyflow.workflow import Workflow


class WorklowTestCase(TestCase):
    @staticmethod
    def cmd(command: str) -> str:
        output = subprocess.check_output(command, shell=True)
        return output.decode()

    @property
    def alfred_debug(self) -> str:
        return "1"

    @property
    def alfred_workflow_bundleid(self) -> str:
        return self.cmd("plutil -extract bundleid raw -o - ./info.plist")

    @property
    def alfred_workflow_name(self) -> str:
        return self.alfred_workflow_bundleid.split(".")[-1].strip()

    @property
    def alfred_workflow_version(self) -> str:
        return self.cmd("poetry version --short")

    @property
    def alfred_workflow_cache(self) -> str:
        return f"/tmp/{self.alfred_workflow_name}"

    def workflow(self, **envs) -> Workflow:
        envs["alfred_debug"] = self.alfred_debug
        envs["alfred_workflow_bundleid"] = self.alfred_workflow_bundleid
        envs["alfred_workflow_name"] = self.alfred_workflow_name
        envs["alfred_workflow_version"] = self.alfred_workflow_version
        envs["alfred_workflow_cache"] = self.alfred_workflow_cache

        with patch.dict(os.environ, envs):
            return Workflow()

    def run_workflow(self, workflow: Workflow, target: callable, *args) -> dict:
        sys.argv = [""] + list(args)
        workflow.run(target)

        return workflow.serialized
