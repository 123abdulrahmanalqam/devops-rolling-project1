class Machine:
    def __init__(self, name, os, cpu, ram):
        self.name = name
        self.os = os
        self.cpu = cpu
        self. ram = ram

    def to_dict(self):
        dictionary = {
            "name": self.name,
            "os": self.os,
            "cpu": self.cpu,
            "ram": self.ram
        }
import logging

def setup_logging():
    logging.basicConfig(
        fileName = 'logs/provisioning.log',
        level = logging.INFO,
        format = '%(asctime)s - %(levelname)s - %(message)s'
    )
    return logging.getlogger()

logger = setup_logging()