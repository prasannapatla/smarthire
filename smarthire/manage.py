#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys
sys.path.append('./smarthire/myenv/lib/python3.5/site-packages') 

def main():
    cwd=os.getcwd()
    print("-----------Development server---------------")
    print(cwd)
    # os.system("fuser -k 3000/tcp")
    # os.system("fuser -k 7000/tcp")
    os.system("sudo chown -R :www-data "+cwd)
    os.system("sudo chmod 771 -R  "+cwd)
    os.system("sudo chmod 777 -R  "+cwd+"/smarthire/myenv")
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'smarthire.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()
