"""
Test custom Django management commands. 
"""
from unittest.mock import patch
from django.core.management import call_command # type: ignore
from django.db.utils import OperationalError # type: ignore
from django.test import SimpleTestCase # type: ignore
